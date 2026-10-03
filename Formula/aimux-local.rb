class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.65"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "0a1a129f2cbbe3d574fb099c8b204700d9bf39507df5258ab0aa321a34d91066"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65/aimux-local-darwin-arm64.tar.gz"
      sha256 "07de4ef34838f4197fc04fdf2c2d5d46c9309f331dcf9bf108f942ee14c78acd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65/aimux-local-linux-arm64.tar.gz"
      sha256 "7a530b763f43e3d0f963c270e396ff8136b7a412a62accd9205771e8f2d0084b"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.65/aimux-local-linux-x64.tar.gz"
      sha256 "94fafbf74453fe54265cd4d10231875ccf792ff8354bd9047a1e06b3a02cbb9f"
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
