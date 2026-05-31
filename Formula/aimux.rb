class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.18"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.18/aimux-darwin-arm64.tar.gz"
      sha256 "8ec8a65c1d89ac355e0e27b627dc6aa2e8ac0e120b21216cb1e92c0cf6a983ee"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.18/aimux-darwin-x64.tar.gz"
      sha256 "a23fa67de15d922e670fb5233af145af8f10a3c9daa5666c8d4195519c774078"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.18/aimux-linux-arm64.tar.gz"
      sha256 "286b62290c0223535e23a986ae367406deebe0e15229ad93139ce41a597bfcc3"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.18/aimux-linux-x64.tar.gz"
      sha256 "529ae95790acddb6dde6dc686b37b8c19b2f4855ada50ad07c7868569297a41f"
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
