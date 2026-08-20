class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.30"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.30/aimux-darwin-arm64.tar.gz"
      sha256 "ea04eb31158dc533c18993aac1e2581c871abeed12e16b0453be71c4e1610186"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.30/aimux-darwin-x64.tar.gz"
      sha256 "8fd0648942aa49d2371e4533f77f0ff80c12c4c7efa14e2195ed3811467c418b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.30/aimux-linux-arm64.tar.gz"
      sha256 "9fe6eeb87166d0fbc5cfb14a6f0c237f3f916c2ad5e77d6628441c27b52e5fc8"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.30/aimux-linux-x64.tar.gz"
      sha256 "bdc9f3e01b0edcea2b3166d2aed314f1cf21d77417ce2a9d1f6a96cf4b4722d9"
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
