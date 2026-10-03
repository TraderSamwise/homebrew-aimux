class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.66"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "23fe031e0fa910f265d96cb92059ca4494a76c858bc1e168d9c1307b7c0e0694"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66/aimux-local-darwin-arm64.tar.gz"
      sha256 "a2b4ce1467d7b01e38e45c990247e03134fa8fda479b3aa157a0eb055d5f30e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66/aimux-local-linux-arm64.tar.gz"
      sha256 "9e2ffb555f8b857a60699ef2703b8d468cab7e6a54a5d52f239f052f09cea38b"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.66/aimux-local-linux-x64.tar.gz"
      sha256 "0f3ab168bbfcad7781efab1d457d958d71a8332b175f87e5bc97a8f25bc14402"
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
