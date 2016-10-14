class X8664LinuxGnuGdb < Formula

  homepage "https://www.gnu.org/software/gdb/"
  url "http://ftpmirror.gnu.org/gdb/gdb-7.12.tar.xz"
  mirror "https://ftp.gnu.org/gnu/gdb/gdb-7.12.tar.xz"
  sha256 "834ff3c5948b30718343ea57b11cbc3235d7995c6a4f3a5cecec8c8114164f94"

  def install
    args = %W[
      --prefix=#{prefix}
      --target=x86_64-linux-gnu
      --disable-werror
      --with-gdb-datadir=#{pkgshare}
    ]

    system "./configure", *args
    system "make"
    system "make", "install"

    rm_rf include
    rm_rf lib
    rm_rf share/"locale"
    rm_rf share/"info"
  end
end
