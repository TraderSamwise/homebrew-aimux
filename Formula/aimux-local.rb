class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.54"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "703960bc12edcc8cbbd53afbfe999fcce54f1a5c14dbd3024dcc35bfdf9bd86d"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-local-darwin-arm64.tar.gz"
      sha256 "0b9c4eba915f93b512840581ca52557db33b95955a87de66ba6662ad49f40bfe"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-local-darwin-x64.tar.gz"
      sha256 "24b181b0a608d6bb00f4e848223f00c7ec1d07099b7161b37651e53937c419c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-local-linux-arm64.tar.gz"
      sha256 "0662428801e7f2909a0a70b63ddef1585fd5d2c8cffebcc783f44dac30f79c84"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-local-linux-x64.tar.gz"
      sha256 "7e65190d6f89562299c66c2a2f20df00f617f55610309cd8cfa90e1c80d84dda"
    end
  end

  depends_on "tmux"
  conflicts_with "aimux", because: "both install the aimux command"

  def install
    libexec.install Dir["*"]
    (bin/"aimux").write_env_script libexec/"bin/aimux", {}
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
