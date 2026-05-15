class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.13/aimux-darwin-arm64.tar.gz"
      sha256 "dcac648a56babb86dce7e61b2ed4858a7eee3dfdc88c988ae740a36b2ebadaf1"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.13/aimux-darwin-x64.tar.gz"
      sha256 "b2b973ee0da1f27a4793b0f55dc575b089da3f72b0694a0bc497dd059ed1c6be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.13/aimux-linux-arm64.tar.gz"
      sha256 "4983ce8d759c18fdb7219523cb8eb0c851ce985bbdd840fa6a8a70d7c9e9ba16"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.13/aimux-linux-x64.tar.gz"
      sha256 "9a4790f9f0a6b12969d40c717670409fca7ee244cdcfbf027b9799e484457cd2"
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
