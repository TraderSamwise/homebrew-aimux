class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-local-darwin-arm64.tar.gz"
      sha256 "9981b20fb5d3ac62da6ee02835e3c51a5010215b450ae7e29de87807f66944cb"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-local-darwin-x64.tar.gz"
      sha256 "5a963043a5a9b8bf2e23ee61c01fded774d222b330e58f8473bfe86760bf8920"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-local-linux-arm64.tar.gz"
      sha256 "60c5c3d5471c3b604cb4218a7e6e7085a24cf126fade94db958cca60494f2a8b"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-local-linux-x64.tar.gz"
      sha256 "85a0f89f6619283520b74af4ecd533118470850751b0674166b482ca403df97f"
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
