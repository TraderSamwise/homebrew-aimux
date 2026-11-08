class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.75"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "141d81952365c57b13d89a7298215736eba159def6147a9491ed04b207cb072d"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75/aimux-darwin-arm64.tar.gz"
      sha256 "eec60930ccee2c4ec8872aab8003f8ce1aaf3e1014a579923435144d0ec17dce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75/aimux-linux-arm64.tar.gz"
      sha256 "5adead4072069362c218ee4d3a3d4b3e22f11a3514779d2e30955f12f3f18b03"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.75/aimux-linux-x64.tar.gz"
      sha256 "a704f154f5fcac03faaa91e9ad64f358cbc43252425e7374df24fb16b8122673"
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
