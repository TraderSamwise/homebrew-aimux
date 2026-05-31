class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.19"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.19/aimux-darwin-arm64.tar.gz"
      sha256 "b551e7ac3a4741b94fade5d7136a9d8392be1024dc74ccf260f79f6ebb49d984"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.19/aimux-darwin-x64.tar.gz"
      sha256 "d588f69bcb64108630e8cd4ee42ddefa89ab0c3d733d96a257c42f2692463233"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.19/aimux-linux-arm64.tar.gz"
      sha256 "22c088c4f4f815c8fadb01c157175ce612b2288a56de8055cf46c586deed69e6"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.19/aimux-linux-x64.tar.gz"
      sha256 "333bd5382ce147d247f3a7500b18c3ab4cf356154aef9dfd98650b50736558fd"
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
