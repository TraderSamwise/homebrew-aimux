class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.26"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.26/aimux-darwin-arm64.tar.gz"
      sha256 "95e6486cbaf11cf3f151a88448c6e7c5c63bb23783e4fa7a94fe76c3b2365953"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.26/aimux-darwin-x64.tar.gz"
      sha256 "6e238035e5401f83fbc1e409b8a1c23d836cb610c885d0bec1d72f62245ec05d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.26/aimux-linux-arm64.tar.gz"
      sha256 "1a084c9a027c47aaedb8b695ca6b0a618a5ae38c85e1cdcdb586cce6dc9cc156"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.26/aimux-linux-x64.tar.gz"
      sha256 "e8f89cb47627fd62a3c2bdfd83645c1d7fc5a1aee9894413d0b4b6e6e614d488"
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
