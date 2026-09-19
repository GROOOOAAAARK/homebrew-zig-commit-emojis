class ZigCommitEmojis < Formula
  desc "Get the best suited emoji for git commits"
  homepage "https://github.com/GROOOOAAAARK/zig-commit-emojis"
  url "https://github.com/grooooaaaark/zig-commit-emojis/archive/refs/tags/0.4.0.tar.gz"
  sha256 "d3b1c0a6d888a585cd05508aef04ae050d171eed14d02f35661a9cdaba9ca2b7"
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
