class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.42"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-darwin-arm64.tar.gz"
      sha256 "aed8b21ecca15126ce282b09a3494f6b070ff07ef1dc9208037e9a7c3934e844"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-darwin-x64.tar.gz"
      sha256 "7168be97cecf8b234603dd4aac97bbfbe6d083d0af1e2ba936c7d67f2fca8041"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-linux-arm64.tar.gz"
      sha256 "b8796af9cfb593ff261386086af2636567b95533928a43fcdd961d239bd2da53"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.42/aimux-linux-x64.tar.gz"
      sha256 "d8bffe503042561e682c0f4530f9ed4542cb51fa5cf14226cdf9520d64cb3d01"
    end
  end

  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/aimux"
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
