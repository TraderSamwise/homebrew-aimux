class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.16/aimux-darwin-arm64.tar.gz"
      sha256 "e000bae76db04d4074fb94e1e75edb69dfa8e2a470d2402b6a8a474a2aa7612c"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.16/aimux-darwin-x64.tar.gz"
      sha256 "e33575dbff903dbdee3c8004ffa8c9a873a68610576fba6871a11e5ed9c63909"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.16/aimux-linux-arm64.tar.gz"
      sha256 "e43d7326f3a0eafb1c6d83398dfe0dbfdb697651d9e050a1cf7917ffb2010244"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.16/aimux-linux-x64.tar.gz"
      sha256 "921590f23239787d557d80f348bf2358bebc300ce5d4a4a8285859be3d8d71d3"
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
