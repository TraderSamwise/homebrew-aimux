class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.34"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.34/aimux-darwin-arm64.tar.gz"
      sha256 "dcdf122a7a66012beacf75de67522638c5ff361a75b0fdf295378612d41013f1"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.34/aimux-darwin-x64.tar.gz"
      sha256 "a9ee5b29770d476a58f1fc70509976943c6ef17468c4ee8c564f9eea9b669770"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.34/aimux-linux-arm64.tar.gz"
      sha256 "cfc0f6980c39425e62f518bcff011440bc33ba2619b93b8402fcf517373cd9b5"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.34/aimux-linux-x64.tar.gz"
      sha256 "900249a019302e4b5b696760293e70cf984e3af91ff3a4e9d8d7792125c53552"
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
