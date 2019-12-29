require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class PhalconAT40rc3 < AbstractPhp73Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.0-rc.3.tar.gz"
  sha256 "d7bd18aa687530f8df89270e13892fac94d2414524f0104f84b9565bdc58d8f6"
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
