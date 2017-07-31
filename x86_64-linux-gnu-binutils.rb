class X8664LinuxGnuBinutils < Formula
  desc "FSF/GNU ld, ar, readelf, etc. for x86_64-linux-gnu development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "https://ftp.gnu.org/gnu/binutils/binutils-2.29.tar.gz"
  mirror "https://ftpmirror.gnu.org/binutils/binutils-2.29.tar.gz"
  sha256 "172e8c89472cf52712fd23a9f14e9bca6182727fb45b0f8f482652a83d5a11b4"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-werror",
                          "--disable-nls",
                          "--enable-gold",
                          "--target=x86_64-linux-gnu"
    system "make"
    system "make", "install"

    # Handle conflicts with binutils.
    # --disable-nls takes care of locale.
    info.rmtree
  end
end
