class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.65"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d9602180bdb9d0dd4e517bc851e48f4a8a688041e7e83df5f35d510bc0b30f3f"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65/aimux-darwin-arm64.tar.gz"
      sha256 "c953c3789cd2f84371a619b2a34ed01d402fdf17e79fe34d6cd99e0471abd456"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65/aimux-linux-arm64.tar.gz"
      sha256 "185c4f16ad5f5c567ce62247226ec523e7d2a74aa9487e231047404f24f4ecac"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65/aimux-linux-x64.tar.gz"
      sha256 "be0d3981b4453d2c1cda9d6203ac14c9aa219aa2e3b304822ba0b1509c4d5b94"
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
