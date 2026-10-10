class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.70"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "765d92abdd0c260a914ef0ae9d65019c004ea6e47ffb307f418447805a1d6a16"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70/aimux-darwin-arm64.tar.gz"
      sha256 "1d68cef1807762f224db743a64190c9a203f4f08ca7b55e36318ac68a0ec14de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70/aimux-linux-arm64.tar.gz"
      sha256 "4b90406d78c276d7c3de9edeccc29e29d53b89f839e0c9c67f53313ce6207e7f"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.70/aimux-linux-x64.tar.gz"
      sha256 "d687e88d99df8b54516c6933990ec28b0a133c9fb7299eb1f2c2a1efb4f4ecfa"
    end
  end

  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    (bin/"aimux").write_env_script libexec/"bin/aimux", {}
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
