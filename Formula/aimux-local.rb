class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.75"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "92222c308e174c1374d15265202214ed7e9edc480b68eeb0b5f989180e2fa787"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75/aimux-local-darwin-arm64.tar.gz"
      sha256 "7f0b2cad736a1393f203fffd25065e4ecf583940a55eecb8fb9da6d74037b60a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75/aimux-local-linux-arm64.tar.gz"
      sha256 "3f3662dd93f8e501c3f7dfe48f18f80491aed3d7b92da05d395da33c0ea758f0"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75/aimux-local-linux-x64.tar.gz"
      sha256 "e08834025e63e3941068d35191b71409927ab23c9501fd7a03a4c6038508b248"
    end
  end

  depends_on "tmux"
  conflicts_with "aimux", because: "both install the aimux command"

  def install
    libexec.install Dir["*"]
    (bin/"aimux").write_env_script libexec/"bin/aimux", {}
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
