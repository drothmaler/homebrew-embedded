require 'formula'

class ArmNoneEabiBinutils < Formula
    homepage 'https://www.gnu.org/software/binutils/'
    url 'http://ftp.gnu.org/gnu/binutils/binutils-2.23.2.tar.bz2'
    mirror 'http://ftpmirror.gnu.org/gnu/binutils/binutils-2.23.2.tar.bz2'
    sha256 'fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097'

    def install
        target = 'arm-none-eabi'

        args = [
            "--target=#{target}",
            "--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",

            '--disable-debug',
            '--disable-nls',
            '--disable-werror',
            "--disable-install-libiberty",
            
            "--enable-interwork",
            "--enable-multilib",
        ]

        mkdir 'build' do
            system '../configure',*args
            system 'make all'
            system 'make install'

            # Removes stupid libiberty.a
            rm_rf prefix/"lib/x86_64"
        end
    end
end
