class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.20/aimux-darwin-arm64.tar.gz"
      sha256 "b0e4e20ffb4acd82811e6150eb10cad95c7c9215286d6854e53d255ecfed6487"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.20/aimux-darwin-x64.tar.gz"
      sha256 "bdc69cf325803f93660396dabde5ebdf2c530c8c2f0ab7efabfd9ff5a1323896"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.20/aimux-linux-arm64.tar.gz"
      sha256 "6748fb512f50867652462712962b9aa654847aeb960610dea82577cfd07ddb93"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.20/aimux-linux-x64.tar.gz"
      sha256 "81224dc0ae0826ef379724db84fdafedd5722d67418edb88a92949af49dbd7e5"
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
