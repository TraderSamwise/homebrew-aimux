class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.43"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-darwin-arm64.tar.gz"
      sha256 "569b1602d763e11cb5a26697a68da56d0fb9a7038d858accb8fb901ce1ac743d"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-darwin-x64.tar.gz"
      sha256 "38c3b297229770ce490bb9924142ab419667f8b39e876b78834bfe89efa4baa9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-linux-arm64.tar.gz"
      sha256 "f918e5742838a423ecb21585079b90e41d1714b7167cb91eef7436910b89f756"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.43/aimux-linux-x64.tar.gz"
      sha256 "a3aae7bbc1f4d5c5b3419134bafa4377671d4e155da1bdbcdd831968e06b9306"
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
