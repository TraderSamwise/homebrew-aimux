class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.66"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6cbf84dca7b09edd4a63e35c505c914b5f5b495aaa60d5d65f7d916f90aee7e3"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66/aimux-darwin-arm64.tar.gz"
      sha256 "89385c2467a6e7a4fb15c20770317003378c52b9d3d581305878ab61cb79af7a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66/aimux-linux-arm64.tar.gz"
      sha256 "11a46236ec71bc9a41cf405f0839d1437fed6b0af3d083d29abe2847713db9cd"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66/aimux-linux-x64.tar.gz"
      sha256 "f701d65d90d13d865924b04a924d9a3dafd69d89979c199e258054c118e0a39d"
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
