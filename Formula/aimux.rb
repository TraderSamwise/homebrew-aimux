class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.44"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-darwin-arm64.tar.gz"
      sha256 "240bd4f92a26b76943f369fc534788023141a145534962dcb2f10eb6c9c2db56"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-darwin-x64.tar.gz"
      sha256 "f02a87ff35ab63f14bad3872834433836ab5067536e97c40d8c0d4396ee25a5f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-linux-arm64.tar.gz"
      sha256 "bd96d37ad7c0766f576ca96b7a2719be72c6aa5df8f610ce402544cac7f22c18"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.44/aimux-linux-x64.tar.gz"
      sha256 "310af84a5f02071cbbece0e32a33c24ef9924e90139716f0630b80d4ced2ef62"
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
