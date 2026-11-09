class Gmutils < Formula
  desc "Genmeta Binary Utilities"
  version "0.9.1"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.9.1-aarch64-apple-darwin.tar.gz"
    sha256 "8dc3720a58d9021b58cf6bbce34dd184717db09c9125375ad13a9b79aee537db"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/gmutils-0.9.1-x86_64-apple-darwin.tar.gz"
    sha256 "c1bff16c5db0886e40f660ec4f83d330f36e1f2dcf4a2745f0034dcff4770119"
  end

  def install
    bin.install "genmeta", "jade"
  end

  test do
    system "#{bin}/genmeta", "version"
    system "#{bin}/jade", "--version"
  end
end
