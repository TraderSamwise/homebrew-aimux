class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.67"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "870e8a10505446f3f1ffff2e0f77595981bbdb3667c44a67b9e66e626982891d"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67/aimux-local-darwin-arm64.tar.gz"
      sha256 "5a8b2038ad4b1d475842b4e847acb3f76604a5c40ace34c791a0027fc93b76fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67/aimux-local-linux-arm64.tar.gz"
      sha256 "392a761473f177325df3f9753b5e88eff5fd621a74ec8c3613ff4b9e4d2625f0"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67/aimux-local-linux-x64.tar.gz"
      sha256 "bb212d91391a5996fd32e2bcc8fc0dcd69b30ca990c99cd2362679d7aa7ed7d5"
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
