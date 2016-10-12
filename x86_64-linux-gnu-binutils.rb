class X8664LinuxGnuBinutils < Formula
  desc "FSF Binutils for x86_64-linux-gnu development"
  homepage "https://www.gnu.org/software/binutils/binutils.html"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.27.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz"
  sha256 "26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f"

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
