class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.71"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a5193781e142b645051f3d4069078f495f15d860bcd91073dbdbf886f7f22663"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71/aimux-local-darwin-arm64.tar.gz"
      sha256 "ec56e4bcb8ef1973bd43b28afe76682b543039a25c3ded326bac6a294079437f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71/aimux-local-linux-arm64.tar.gz"
      sha256 "f438d50434fd7cd10bf34b2855009518457a602504847932cb6b774ebc212418"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71/aimux-local-linux-x64.tar.gz"
      sha256 "f8f97e5683014943b483e448e32b93d252f8fab35735f7cfe721f94008ec759a"
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
