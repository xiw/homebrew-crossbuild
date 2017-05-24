class Aarch64LinuxGnuBinutils < Formula
  desc "FSF Binutils for aarch64-linux-gnu development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.28.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.28.tar.gz"
  sha256 "cd717966fc761d840d451dbd58d44e1e5b92949d2073d75b73fccb476d772fcf"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-werror",
                          "--disable-nls",
                          "--enable-gold",
                          "--target=aarch64-linux-gnu"
    system "make"
    system "make", "install"

    # Handle conflicts with binutils.
    # --disable-nls takes care of locale.
    info.rmtree
  end
end
