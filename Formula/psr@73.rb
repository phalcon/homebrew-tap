require File.expand_path("../Abstract/abstract-php-extension", __dir__)

class PsrAT73 < AbstractPhp73Extension
  init
  desc "PHP extension providing the accepted PSR interfaces "
  homepage "https://phalconphp.com/"
  url "https://github.com/jbboehr/php-psr/archive/v1.0.0.tar.gz"
  sha256 "f85be1d1434368abd16e06b81e394487f81b5e2706220f01c85558ba486ee3e7"
  head "https://github.com/jbboehr/php-psr.git"

  bottle do
    root_url "https://github.com/phalcon/homebrew-tap/releases/download/v4.0.x"
    sha256 cellar: :any_skip_relocation, big_sur: "78320e74907e968796963d796cffc158ff6f4b124d57b3e173c68c39e941e85e"
  end

  depends_on "pcre"

  def install
    safe_phpize

    system "./configure", "--prefix=#{prefix}", phpconfig, "--enable-psr"
    system "make"
    system "make", "install"

    prefix.install "modules/psr.so"
    prefix.install "modules/psr.la"

    write_config_file if build.with? "config-file"
  end
end
