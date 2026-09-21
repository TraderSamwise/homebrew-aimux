class Aimux < Formula
  desc "Local agent multiplexer for AI coding tools with native TUIs"
  homepage "https://aimux.app"
  version "0.1.51"
  license "MIT"

  bottle do
    root_url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8d4597ec6a6873a534c63fd5cd83a8759a57a2c0a3ea4a1d569f32b118dba0e5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c238ee3a0c85d49d5f42fd61aaf43aacdb81bb5f04fe0ca805f5a291e37817aa"
    sha256 cellar: :any_skip_relocation, sequoia: "d6d4d70b8ab13f9411ba9d6ae961598fa1d034b3e57f37bcb7855b73c353df2e"
    sha256 cellar: :any_skip_relocation, sequoia: "e0777e46d4f6c3f328f33990d0f35f0a7190fc6a2fd51e651247afd94a9a173e"
  end

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-darwin-arm64.tar.gz"
      sha256 "a2cf734a39cd416bde3c185a7213f90e34f6ef7c5e9c84140f1e017cae9a8421"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-darwin-x64.tar.gz"
      sha256 "196dff4521a2958744faeb925999bde52e75578af53afbbe8f8f8e2af79ab72c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-linux-arm64.tar.gz"
      sha256 "48e98fcb49c1e5e7252548e2a745f89bb6776f92588b48af26245025b36ae1ac"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.51/aimux-linux-x64.tar.gz"
      sha256 "528987437e2be2618e2c0344a6eeb10c59db1481b56f12ea9b55faae519eea31"
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
