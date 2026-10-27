class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.71"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "09da9cf5d3c715dd2d3093d545d79cd2dbe03de3ed13867b491c08a9a9635085"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71/aimux-darwin-arm64.tar.gz"
      sha256 "60748665224aa999c8dae42f0d007c3b088c677d0c66a4fbaed1d3e5609635cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71/aimux-linux-arm64.tar.gz"
      sha256 "580fdc6736161f404a7e051ea6a054b3edab58aa5d0e3c9f3798715b78950f01"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.71/aimux-linux-x64.tar.gz"
      sha256 "780d674544045f7498e906fe55d0bbf6bed30f028ebc84bf313c02dab892e02b"
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
