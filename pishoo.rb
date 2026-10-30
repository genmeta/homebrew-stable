class Pishoo < Formula
  desc "modern, secure, QUIC-powered web/proxy engine"
  version "0.9.0"
  homepage "https://www.dhttp.net"
  license "Apache-2.0"

  on_arm do
    url "https://download.dhttp.net/homebrew/stable/pishoo_0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "e5f9fd353c16f425b671c663a6c76767e4de90aed0042de861177127cfaa760e"
  end

  on_intel do
    url "https://download.dhttp.net/homebrew/stable/pishoo_0.9.0-x86_64-apple-darwin.tar.gz"
    sha256 "dc72b5063c9867e6cd6990a74c1f4c86a4af71051e4139bbb994b1000b4e1d9d"
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
