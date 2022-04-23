require 'formula'

class Newlib < Formula
  url 'ftp://sources.redhat.com/pub/newlib/newlib-1.19.0.tar.gz'
  mirror 'ftp://sourceware.org/pub/newlib/newlib-1.19.0.tar.gz'
  homepage 'http://sourceware.org/newlib/'
  sha256 '4f43807236b2274c220881ca69f7dc6aecc52f14bb32a6f03404d30780c25007'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end