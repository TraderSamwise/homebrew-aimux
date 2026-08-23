class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.32"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.32/aimux-darwin-arm64.tar.gz"
      sha256 "59c43a2c2f63af3ae58b87605efa82a23daa776e5f67ff148a901639cd337ece"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.32/aimux-darwin-x64.tar.gz"
      sha256 "41f163fd02653e568f2e6cc81354611f47f8eae52b1078b5e361e334297a1d65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.32/aimux-linux-arm64.tar.gz"
      sha256 "8f1d97aa1aff624c20146f1abb25a4434ab5f0c5b674cd58f34f172592948341"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.32/aimux-linux-x64.tar.gz"
      sha256 "4ffc0aa642257b411bd16e5f5a61e05f276e58859e1a1e55c912a245e558641b"
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
