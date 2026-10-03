class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.67"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "9d8221ec8c0ba4f6002e55cfa39e2e4f8999b2aa9ad9aecc07d1b3c008f9ff0d"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67/aimux-darwin-arm64.tar.gz"
      sha256 "1bfe2efb12da94c2d637a2a21aeb2cd5936fff4e1ee746320903791098766101"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67/aimux-linux-arm64.tar.gz"
      sha256 "a9784a60927499d23f0e78f0ee33ddea05845594008f5e6fc201ceb4b3003792"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.67/aimux-linux-x64.tar.gz"
      sha256 "4aab880822316c72a93451bed8388f64b74097dcf538ad8d9483e056ba56d49f"
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
