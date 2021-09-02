require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PhalconAT405 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.5.tar.gz"
  sha256 "b6b618911a4dfe60ba63708d92811d4885b8b5220c45981ff1cb7750523074f4"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    sha256 cellar :any_skip_relocation
    root_url "https://github.com/phalcon/homebrew-tap/releases/download/v4.0.5"
    sha256 "d429b4580bdcfbc8b4ac423c15a913d593856b84b00fdc59bc66296c15c8a2ec" => :catalina
    # sha256 "49576fba7362f29fb06fa5586bbe92473bd4c7f051eb88ef3d159e68cebb7728" => :mojave
    # sha256 "20b862ff1c24b8fa33462f01c61a10e2f08fa67a1a94be69df38af662d893398" => :high_sierra
    # sha256 "4df08e30b0147234585ec94639fc01c8d80767dcb77f6c4cfe1df3943d4ee144" => :sierra
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
