class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.14/aimux-darwin-arm64.tar.gz"
      sha256 "7dab8fad988d5cfd742ba9df3700ee9a4abfbe17903d4bc81eb637344e056e2d"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.14/aimux-darwin-x64.tar.gz"
      sha256 "6eba62a8cee7607961fe91fe6f0765ece2e4d8016428f0c909a16132733db7cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.14/aimux-linux-arm64.tar.gz"
      sha256 "56e24ee996078010476c9a91dbac6ae8c6ecf5bd78c3655719bca8330c9baf87"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.14/aimux-linux-x64.tar.gz"
      sha256 "053378571e9c69939a59ddb6648b9bf6bee1e55dc994dbb3e757177552c48e38"
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
