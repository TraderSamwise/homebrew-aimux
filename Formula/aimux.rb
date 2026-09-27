class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.62"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4ec0e1b81b7421e7e3d57564923df236665a945f916d83e1e8a492f16dd70535"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62/aimux-darwin-arm64.tar.gz"
      sha256 "563c0a1e1444d1733b42e93df42742393f4383ea4135531acb5a040fa8216860"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62/aimux-linux-arm64.tar.gz"
      sha256 "c75a5824b0712cb9b335214f1277e0c616d28463cb453c6f800d8b80581fcaa3"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.62/aimux-linux-x64.tar.gz"
      sha256 "b42276289d07635165844252d8dfecdd43f205a122be1907ea7fd623f9630673"
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
