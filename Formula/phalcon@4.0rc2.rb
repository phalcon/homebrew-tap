require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT40rc2 < AbstractPhp73Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.0-rc.2.tar.gz"
  sha256 "74d98059fdfd20486eff953118b59fa6f50ac971d64e26e1ce672fe4d58abc6b"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
  end

  depends_on "pcre"
  depends_on "psr@73"

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"

    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
