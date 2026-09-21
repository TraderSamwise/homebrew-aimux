class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.56"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7c1c8954ce7774f17444bca25557e51a769459186a3c2e7d9a50d1944e9d73fa"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-darwin-arm64.tar.gz"
      sha256 "e4bc33a869672c11cc1b5b7b66e44bc71c6db691c18415f36ec134c382e80216"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-darwin-x64.tar.gz"
      sha256 "b06c08564c177aa0de38cd8c7bb4b6bc38bb84e1956deda0ad4330789edfd65a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-linux-arm64.tar.gz"
      sha256 "e108ac920c0e2d7307fd49662df2c7503ec0d1bba10cbf27795e08e24101376b"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.56/aimux-linux-x64.tar.gz"
      sha256 "a24955ff4171c197f4daba04926ace8760f108b24837564f45649daff60a44ca"
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
