class Aimux < Formula
  desc "Native CLI agent multiplexer — run AI coding tools with their native TUIs intact"
  homepage "https://github.com/TraderSamwise/aimux"
  version "0.1.17"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.17/aimux-darwin-arm64.tar.gz"
      sha256 "63fbb2268e34d815f1c39f011ea721fecadae60d1acffb2f0974ad3503bf36aa"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.17/aimux-darwin-x64.tar.gz"
      sha256 "7dd3166b5604148f60d2833162feee4c6544f6ef438e91c8477cb40fd9b74c72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.17/aimux-linux-arm64.tar.gz"
      sha256 "c0872d70a736db149c2dd11a07f7dc67f47c299d6b56d4ea5df8c0e115423f10"
    end
    on_intel do
      url "https://github.com/TraderSamwise/aimux/releases/download/v0.1.17/aimux-linux-x64.tar.gz"
      sha256 "ab97bc3ec7d02e158f305c985b664e45eb43c13f6de6bc8d813ac576a3427ab2"
    end
  end

  depends_on "node"
  depends_on "tmux"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/aimux"
  end

  test do
    assert_match "aimux", shell_output("#{bin}/aimux --help 2>&1", 0)
  end
end
