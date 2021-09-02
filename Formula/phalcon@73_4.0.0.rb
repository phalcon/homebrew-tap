require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT73400 < AbstractPhp73Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.0.tar.gz"
  sha256 "825b0d0f33e5d0b6aa120f74c6cd7419240dc376c42253ec5e5dc1a9eef67598"
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
