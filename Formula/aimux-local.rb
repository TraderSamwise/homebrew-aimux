class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.64"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "77e45c125b35b07bc4ff315d37e7aeb5104a3960b8c40a511a76609118432d81"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64/aimux-local-darwin-arm64.tar.gz"
      sha256 "4b7066052d0982a95c25a63943214782635f814c2525b0c27b9189aecf14e027"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64/aimux-local-linux-arm64.tar.gz"
      sha256 "7602917ec4d8805048db31378edfc84d6e4528cf47642b9bea63ee73ef1ac7f8"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.64/aimux-local-linux-x64.tar.gz"
      sha256 "ec8e567d73f06e777f1197cc17850691acdb287503a469f5e92be7927663dad7"
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
