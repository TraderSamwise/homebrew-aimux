class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.24"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.24/aimux-darwin-arm64.tar.gz"
      sha256 "54dd1fa3afb0e213364c7836688cbefa4510fb04c03cbdd5a65643f3b2bb37c1"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.24/aimux-darwin-x64.tar.gz"
      sha256 "e3c8b0ffc451a06624975527fef9e6b4d8b602b068d74e2d9c78a6d40398a206"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.24/aimux-linux-arm64.tar.gz"
      sha256 "ff2e1e615cfb865bf02d3949219ff38a213155681dcde8eda08ddb01a8924d17"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.24/aimux-linux-x64.tar.gz"
      sha256 "9ae7f7856853dceb08932b26e0386688c81522a87cf79a95bfd6e1eab0928901"
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
