class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.33"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.33/aimux-darwin-arm64.tar.gz"
      sha256 "af9c192bf39580060b1a2ee52732f22c4eb9d0f71b1f6a1acb5782b85e2743a3"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.33/aimux-darwin-x64.tar.gz"
      sha256 "70b9ac1c94405c212e4551b8cfaac85af1b9ea69a177444437826988d0e05467"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.33/aimux-linux-arm64.tar.gz"
      sha256 "1588e5af71afb648541630923f197d8b373517f0351fc77ef77a77cb3eef1542"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.33/aimux-linux-x64.tar.gz"
      sha256 "9e2ec5e13dd2d6b69728417235df2c27fbd283fa61d64add86f59c2841c4e526"
    end
  end

  depends_on "node"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/aimux"
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
