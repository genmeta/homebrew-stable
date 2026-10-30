class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.9.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "5f110e412890db01b5f2db0d6ca113cc32b9c990e57b81fb7456f7a3cedb90f9"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "c4b9dc9418b712057ea8083c8ca00b3608c55b3f8f0272be67a496ef0a067678"
  end

  def install
    bin.install "genmeta", "jade"
  end

  test do
    system "#{bin}/genmeta", "version"
    system "#{bin}/jade", "--version"
  end
end
