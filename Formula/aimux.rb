class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.64"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8be8202dc941f6d704e60a142e4c1127406cda37bb7518451bd4da10acfc07dc"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64/aimux-darwin-arm64.tar.gz"
      sha256 "a1765a41aa276948bcceab402678739f6cbee267f46f705462d8992a56261faa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64/aimux-linux-arm64.tar.gz"
      sha256 "e882a280e4730326ba4a606feb01d6ce23a513e759b2ec738b161d27559a0b7f"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64/aimux-linux-x64.tar.gz"
      sha256 "ca8657c14e7d2a1cf2b5354d10695c4a8b9a887f0e3499d04b0ac4a60ff3212c"
    end
  end

  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    (bin/"aimux").write_env_script libexec/"bin/aimux", {}
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
