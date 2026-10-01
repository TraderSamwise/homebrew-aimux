class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.63"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "30c0e6c54c01d989c68b7125376559cc445ea331497288c0d03134b13db37869"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63/aimux-darwin-arm64.tar.gz"
      sha256 "0b155ae282d9c048da92ceeb3951be4d71f9caf6a5b6e20c19ca8a1bc3956620"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63/aimux-linux-arm64.tar.gz"
      sha256 "bddb9299a14f77bd96fe76690b08f42b71c7533a283e639020a447e596de53e7"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.63/aimux-linux-x64.tar.gz"
      sha256 "73b216b630fef88b9afa9e8df03828d9d267d55061b05501c11928e6b91caee2"
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
