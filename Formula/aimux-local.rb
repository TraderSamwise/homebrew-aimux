class AimuxLocal < Formula
  desc "Local agent multiplexer for AI coding tools without remote control"
  homepage "https://aimux.app"
  version "0.1.63"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "826a06be347a009cd068c8a21363afa91921285a627cea5cab6838764dde3ca8"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63/aimux-local-darwin-arm64.tar.gz"
      sha256 "c46adf2948b75f8915ec63cbc85781635da65ed81a9b1da19a96825ea85194ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63/aimux-local-linux-arm64.tar.gz"
      sha256 "7ceff8b2c2e23da5cab3509b855a6805c1130b1ac1b3c03ce21c52d3b5c5c4d8"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63/aimux-local-linux-x64.tar.gz"
      sha256 "280d8aacde2b8248ced1ad026802628dfc9e59d18791738caef20af6a98d3261"
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
