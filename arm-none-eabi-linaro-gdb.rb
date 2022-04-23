require 'formula'

class ArmNoneEabiLinaroGdb < Formula
  homepage 'http://www.linaro.org'
  url 'https://launchpad.net/gdb-linaro/7.5/7.5-2012.12/+download/gdb-linaro-7.5-2012.12.tar.bz2'
  sha256 '0ef9e001289dbe3a998e3448907593e0d79f3134f74c600ee1a2756b4678345d'


  def install
    target = 'arm-none-eabi'

    ENV['CFLAGS'] = '-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=0'
    
    args = [
        "--target=#{target}",
        "--prefix=#{prefix}",
        "--infodir=#{info}",
        "--mandir=#{man}",
        
        "--enable-interwork",
        "--enable-multilib",
        '--disable-werror',
    ]

    mkdir 'build' do
        system '../configure', *args
        system 'make all'
        system 'make install'
    end
  end
end
