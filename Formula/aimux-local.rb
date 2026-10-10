class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.70"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ebafee1a5d9f54d80f6a78e307f7c93f79a9d4a3b37d0f75b0fe28ef4a57a2f3"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70/aimux-local-darwin-arm64.tar.gz"
      sha256 "9909bed4760f7e5719a5e4042e1b4b4d38ea118819d00f41c7800336bb6a7a17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70/aimux-local-linux-arm64.tar.gz"
      sha256 "1fd963fa549a5e55e780f5cd7e134fc7e73eda1f807eb8cadc40611b22269256"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70/aimux-local-linux-x64.tar.gz"
      sha256 "91094366404a3b39450889c90c81f12692fd7fcf38626ae4d1e17ec374c9ef83"
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
