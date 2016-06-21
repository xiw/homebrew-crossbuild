class Aarch64LinuxGnuBinutils < Formula
  desc "FSF Binutils for aarch64-linux-gnu development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.26.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz"
  sha256 "9615feddaeedc214d1a1ecd77b6697449c952eab69d79ab2125ea050e944bcc1"

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
