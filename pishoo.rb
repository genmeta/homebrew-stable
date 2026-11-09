class Pishoo < Formula
  desc "modern, secure, QUIC-powered web/proxy engine"
  version "0.9.1"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/pishoo_0.9.1-aarch64-apple-darwin.tar.gz"
    sha256 "af2eb99e34b158fec2ca0d69aeebd2bafe1a2b3657963543db3610462aca79b2"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/pishoo_0.9.1-x86_64-apple-darwin.tar.gz"
    sha256 "707dcd4b4255de8cca530c09d4b33af643ddd8d435f1723d3a7cfe34b09efb5b"
  end

  def install
    bin.install "pishoo"
  end

  def caveats
    <<~EOS
      Run Pishoo as the user who owns ~/.dhttp.
      Identity directories and current databases are initialized at first startup.
      Existing data is preserved; unsupported legacy databases stop startup with a diagnostic.
      To run as the current user, use: brew services start pishoo
      To install Workspace after configuring an identity and starting Pishoo:
        brew install gmutils
        genmeta install workspace --id YOUR_IDENTITY
      Run genmeta as the account that owns the identity. App dependencies install automatically.
    EOS
  end

  service do
    run [opt_bin/"pishoo"]
    keep_alive true
    log_path var/"log/pishoo.log"
    error_log_path var/"log/pishoo.error.log"
    working_dir HOMEBREW_PREFIX
  end

  test do
    assert_predicate bin/"pishoo", :executable?
  end
end
