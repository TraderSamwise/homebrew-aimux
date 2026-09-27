class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.62"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8c345d472457c6f9dff9c92edfc789ca7376179b962e106113f02e21ed61e72c"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62/aimux-local-darwin-arm64.tar.gz"
      sha256 "bfcff304358e6b8811bdf875cbb9c11f1f3dfbfdaab0953a9a9c64b18d9dee9a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62/aimux-local-linux-arm64.tar.gz"
      sha256 "42752e1310344a27bf73594c43f865f9b93a5d3da5ba3117abd6dbe6caf512b5"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62/aimux-local-linux-x64.tar.gz"
      sha256 "dfc4b66146016a17843d9a46c38fca5666bafa801a04b91d28b89443e1ab6503"
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
