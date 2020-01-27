require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class PhalconAT403 < AbstractPhp74Extension
  init
  desc "Full-stack PHP framework"
  homepage "https://phalconphp.com/"
  url "https://github.com/phalcon/cphalcon/archive/v4.0.3.tar.gz"
  sha256 "db54ad12010e2f38c4a573e4552362f9199bbdd828033546e676bb466c5dbaf0"
  head "https://github.com/phalcon/cphalcon.git"

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/phalcon/homebrew-tap/releases/download/v4.0.2"
    # sha256 "0898dcd857d75284e538b737ac89470558ea7e77c347f223923dd54f347ea5ca" => :catalina
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
