class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.31"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.31/aimux-darwin-arm64.tar.gz"
      sha256 "7d940ffe3b9ff26084f01ac5098f41befc893d37947c5875608e235d726f5ad2"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.31/aimux-darwin-x64.tar.gz"
      sha256 "fead47ccd12a21c449d2aac5bfa057ce53803ff828a86a12b338029172520737"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.31/aimux-linux-arm64.tar.gz"
      sha256 "bb99d8e44d9b5d6a9ff8ba2e662d9ae064ad9f98724ec0df24829b9d42c80056"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.31/aimux-linux-x64.tar.gz"
      sha256 "697020eaa25b133098997709ddc9b2364fc447da1c718aec7b6277f42d65664b"
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
