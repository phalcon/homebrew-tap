require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class PhalconAT400 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/4.0.x.tar.gz"
  sha256 "b8c8c5c331fed6c216ed5f799aadd3c06dac66e9b814a48c38ec9df4eb4c642c"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/phalcon/homebrew-tap/releases/download/v4.0.x"
    sha256 "7c7eb1ec5fa66a15c168fba4eec1bf7f0f2d05acf0e850b6156f53b0c8974ddb" => :high_sierra
    sha256 "ef46d66685ba718574c1ade55de2e8efac32c5291d6c4bdb8b6d31d42e1cee69" => :sierra
  end

  depends_on "pcre"
  depends_on "psr"

  def install
    Dir.chdir "build/php7/64bits"

    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-phalcon"
    system "make"

    prefix.install "modules/phalcon.so"
    write_config_file if build.with? "config-file"
  end
end
