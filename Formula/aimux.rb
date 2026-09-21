class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.54"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b6d9dd1aa31c92e52b3ec1ad23b5492a8456c1751ff2f154ec3ec9912cf611fa"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-darwin-arm64.tar.gz"
      sha256 "8e66542d29ecb92a7263259a37c6a4cb38c80e14a47acdd61822beab77422a5e"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-darwin-x64.tar.gz"
      sha256 "05b1af6695c61cd7a00b1645875af34764f5216996fed85cc8813d75b47e5692"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-linux-arm64.tar.gz"
      sha256 "bc2bda455b914c4d1da2ebdad7a732ff03d939b7db62cdce9739596e6befc5ab"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.54/aimux-linux-x64.tar.gz"
      sha256 "f659fb5bbc124cb218a3bb7ae8ece58a11a3a72558acf8cab05918d101cc0907"
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
