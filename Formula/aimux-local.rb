class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.51"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c238ee3a0c85d49d5f42fd61aaf43aacdb81bb5f04fe0ca805f5a291e37817aa"
    sha256 cellar: :any_skip_relocation, sequoia: "d6d4d70b8ab13f9411ba9d6ae961598fa1d034b3e57f37bcb7855b73c353df2e"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-local-darwin-arm64.tar.gz"
      sha256 "21bc61a37f838d094d245a0ca69d0f9351db5e767dea573465f26be2b4a8c3d5"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-local-darwin-x64.tar.gz"
      sha256 "00e4b5c1fa2e02a1910ae86fde31c9a35af010817f38379c9f3d4fed1cfdde6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-local-linux-arm64.tar.gz"
      sha256 "356f0ac248955c3766551e5b13a40d06d9c44157e223281417dc8ed2f2dcb9a2"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-local-linux-x64.tar.gz"
      sha256 "50f70e7cda35837c1a6c90cbe281d0769592dea89ee21a5b7cfa341e5dfd389f"
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
