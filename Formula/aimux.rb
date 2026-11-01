class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.72"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aa99757f38f50659aee0e848cd5b55441a65b63281a43812ea71b97a0436afa8"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72/aimux-darwin-arm64.tar.gz"
      sha256 "f1ed0436177f9301f5e999167148d368e4c5e7c7a57125970db14cf146850131"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72/aimux-linux-arm64.tar.gz"
      sha256 "bb8cae5bfef5c7f195978d4d5d5709cdcfdc2bc739b1b043be22e52ce08715a8"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.72/aimux-linux-x64.tar.gz"
      sha256 "7b32e35fd673d1042966f4281cce96319cd2bff12c316fd39b071b4f501eb89a"
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
