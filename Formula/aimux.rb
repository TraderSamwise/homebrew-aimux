class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.28"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.28/aimux-darwin-arm64.tar.gz"
      sha256 "04ece25a89a864815a540630bef354499326eda4c568b5d3fd60dfe45a45abff"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.28/aimux-darwin-x64.tar.gz"
      sha256 "7da129a691a5e73e685322cb4314643b3f365f8f95c2736fe7e7e48a290f4156"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.28/aimux-linux-arm64.tar.gz"
      sha256 "b6d437068082be03d6047f93e33466330be67cda7af066941d8959160d61239a"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.28/aimux-linux-x64.tar.gz"
      sha256 "a6d27a97bdc4589dd708512cdd935231c8f3c8bf52afacd213380348945c6ced"
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
