class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.21"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.21/aimux-darwin-arm64.tar.gz"
      sha256 "dad2bb67b5570fb05b85183f1afaff02631a67c18bd8d48cbdd133b4b3af0198"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.21/aimux-darwin-x64.tar.gz"
      sha256 "6c07320676c8c77b65f5da7849b7ea06902b8a7c1b05cb28eccbb0022b16eb50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.21/aimux-linux-arm64.tar.gz"
      sha256 "7bbd4632daa31939ef246beec6bcd19618b531f25594d231f6024956d4ad1242"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.21/aimux-linux-x64.tar.gz"
      sha256 "586532cec4b216ff143fca565ee993bc12a143317e9c5c45947bd63e2f1d34cf"
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
