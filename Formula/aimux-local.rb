class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-local-darwin-arm64.tar.gz"
      sha256 "9f93f8e6eb4550d4df8482e6370087e21be60a330f980bd677853e385523f92a"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-local-darwin-x64.tar.gz"
      sha256 "6af9e003374f66242bc47577c6b4fd0490e1c5aac4c8c6867aab9f19174dd769"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-local-linux-arm64.tar.gz"
      sha256 "560a083b686b41b99df1f10acc3ed75d925fe74168b351d8920d311d9a77e089"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-local-linux-x64.tar.gz"
      sha256 "49b03eea7509ee5d7591b79abd881510cfee0310782515bd4b6466031a972bfb"
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
