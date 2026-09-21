class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.56"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "66ef0e466eacc93540ac8d6f2789731c5101eb8aabe0c88a0904847a63ae4c57"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-local-darwin-arm64.tar.gz"
      sha256 "909571ac8b747a1c107c8523bba3ac64a3c8788244c174a4427f10f4b6e6520c"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-local-darwin-x64.tar.gz"
      sha256 "a0ca9cdfb47c81232afc762e0f58ef34e2ef39d9a81624bb78be51a16e4b85ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-local-linux-arm64.tar.gz"
      sha256 "fee76ed8151b9b1fa5e609c5ccc706cc8957dfff0472771a24611708258e9400"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-local-linux-x64.tar.gz"
      sha256 "7b99a3c84dd4ff2cea594ed598e33096335c5c5b36f8e94fb197068a0971175c"
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
