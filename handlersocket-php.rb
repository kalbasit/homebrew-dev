require 'formula'

class HandlersocketPhp < Formula
  homepage 'http://code.google.com/p/php-handlersocket/'
  url 'https://php-handlersocket.googlecode.com/files/php-handlersocket-0.3.1.tar.gz'
  md5 '87689883a01fd9bc8b0467c0bd96cf6a'

  depends_on 'libhsclient'
  depends_on 'php55'

  def install
    libhsclient_prefix = Formula.factory('libhsclient').prefix
    system "phpize"
    system "./configure", "--prefix=#{prefix}",
                          "--with-handlersocket-includedir=#{libhsclient_prefix}/include/handlersocket"
    system "make"
    prefix.install 'modules/handlersocket.so'
  end
end
