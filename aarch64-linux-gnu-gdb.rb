class Aarch64LinuxGnuGdb < Formula
  desc "GNU debugger for aarch64-linux-gnu"
  homepage "https://www.gnu.org/software/gdb/"
  url "https://ftp.gnu.org/gnu/gdb/gdb-8.0.tar.xz"
  mirror "https://ftpmirror.gnu.org/gdb/gdb-8.0.tar.xz"
  sha256 "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"

  depends_on "pkg-config" => :build

  def install
    args = [
      "--prefix=#{prefix}",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--without-python",
      "--target=aarch64-linux-gnu",
    ]

    system "./configure", *args
    system "make"

    # Don't install bfd or opcodes, as they are provided by binutils
    inreplace ["bfd/Makefile", "opcodes/Makefile"], /^install:/, "dontinstall:"

    system "make", "install"

    # Remove conflicting items with binutils
    rm_rf include
    rm_rf lib
    rm_rf share
  end

  def caveats; <<-EOS.undent
    gdb requires special privileges to access Mach ports.
    You will need to codesign the binary. For instructions, see:

      https://sourceware.org/gdb/wiki/BuildingOnDarwin

    On 10.12 (Sierra) or later with SIP, you need to run this:

      echo "set startup-with-shell off" >> ~/.gdbinit
    EOS
  end
end
