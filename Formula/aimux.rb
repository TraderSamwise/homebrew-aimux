class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.27"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.27/aimux-darwin-arm64.tar.gz"
      sha256 "31d347b0536f6ca1f942b7884fbee8ff3c6030bb329c3e2c4adc807b19a9081f"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.27/aimux-darwin-x64.tar.gz"
      sha256 "679076c32245ce3bf41bf26d1721c874b21308b0800e120c6a88f95d1dbc0a1d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.27/aimux-linux-arm64.tar.gz"
      sha256 "76001ed3a4f585fe4f04e3139c0569cb2ab22a79ba36a1f974959d3ac13f6d0e"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.27/aimux-linux-x64.tar.gz"
      sha256 "cf4713d256b7ee2ac758d53f1715b5ae1199525df4526856c2ca11e602ed1467"
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
