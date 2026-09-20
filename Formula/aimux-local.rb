class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-local-darwin-arm64.tar.gz"
      sha256 "55e3f394062f299ab9aaa185d44553d2fdb5a32e55cf4e14bf7fda8db76c2bc2"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-local-darwin-x64.tar.gz"
      sha256 "5c65062ff95ab8f5ae30cd7381d31ab1b27a8964ebab0451fd4f141596ababee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-local-linux-arm64.tar.gz"
      sha256 "5a1ada33ce4cabe09e9411f503005fd01da57af40168cf95f58cd4fa8e53bc59"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-local-linux-x64.tar.gz"
      sha256 "62ba0210748afaa8cecb8e8ed21b9180c73198f727a04055f5effec8347bc41f"
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
