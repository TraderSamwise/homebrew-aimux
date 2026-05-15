class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.15/aimux-darwin-arm64.tar.gz"
      sha256 "32041e35b811c272d82a6827f02b9aa3c0de7237c5452031ec635c60c409f43e"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.15/aimux-darwin-x64.tar.gz"
      sha256 "bd6157ace25c76b621cac926c9aa6c34ab9892316bae900132dfcd2831dd0e2b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.15/aimux-linux-arm64.tar.gz"
      sha256 "446ff9ea6ab10ae624e7616a2c651a5fee566e331446a4dbcdf1705a957a0e5e"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.15/aimux-linux-x64.tar.gz"
      sha256 "8a94e5613363069959dfb46ea730bf21e3372146628b7d8ee3f9fd7707ddbf77"
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
