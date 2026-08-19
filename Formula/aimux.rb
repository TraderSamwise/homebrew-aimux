class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.29"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.29/aimux-darwin-arm64.tar.gz"
      sha256 "94f619855b4b5fd74bcf32ccb9699d831a73930eeeffcd908aeb933b6122d1ba"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.29/aimux-darwin-x64.tar.gz"
      sha256 "a10fd14394b33149bc87f88b68f01ff4f631551c44c26c7c192668e5d1d007f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.29/aimux-linux-arm64.tar.gz"
      sha256 "dcbe6f3c219e0ba156c1f7166fca2a109025b404fbbfc6b3c8e1a33e27c1c46f"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.29/aimux-linux-x64.tar.gz"
      sha256 "2db8ed295db1b640b4317b419562a3dec58dc2bf08313bd528d780a2ef91dc05"
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
