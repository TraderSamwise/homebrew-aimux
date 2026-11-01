class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.72"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "98b047ae72bf9f76f780cc15d4e5c8ab2c590d9998f462cd7625fa1b4e905db3"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72/aimux-local-darwin-arm64.tar.gz"
      sha256 "ea0fdb25b8a5e4c892058bac049192c81ebf5dea35c7a13e97bbdb64d3ac6d5e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72/aimux-local-linux-arm64.tar.gz"
      sha256 "64657fab83f3a4a99feb9b184d6180ebd7eb26682687b0e838fa074cc4214834"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72/aimux-local-linux-x64.tar.gz"
      sha256 "95a0fc4475b1609a76d51ca96f4034aa2409421f0cddb6b10c3db4ff8333bb64"
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
