class ZigCommitEmojis < Formula
  desc "Get the best suited emoji for git commits"
  homepage "https://github.com/GROOOOAAAARK/zig-commit-emojis"
  url "https://github.com/grooooaaaark/zig-commit-emojis/archive/refs/tags/0.4.2.tar.gz"
  sha256 "366213fc3332e801b80585ae8f2a398cae2284ab7b89e97273e47e554f8d9205"
  license "MIT"

  depends_on "zig@0.16" => :build

  deny_network_access!

  def fetch
    system "zig", "build", "--fetch"
  end

  def install
    system "zig", "build", *std_zig_args
  end

  test do
    assert_match "USAGE:", shell_output("#{bin}/zig-commit-emoji --help")
  end
end
