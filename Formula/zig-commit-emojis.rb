class ZigCommitEmojis < Formula
  desc "Get the best suited emoji for git commits"
  homepage "https://github.com/GROOOOAAAARK/zig-commit-emojis"
  url "https://github.com/grooooaaaark/zig-commit-emojis/archive/refs/tags/0.4.0.tar.gz"
  sha256 "d3b1c0a6d888a585cd05508aef04ae050d171eed14d02f35661a9cdaba9ca2b7"
  license "MIT"

  depends_on "ruby"

  deny_network_access!

  def fetch
    ENV["BUNDLE_PATH"] = ".bundle"

    system "bundle", "cache", "--no-install"
  end

  def install
    ENV["GEM_HOME"] = libexec

    system "bundle", "install", "--local"
    system "gem", "build", "#{name}.gemspec"
    system "gem", "install", "--ignore-dependencies", "#{name}-#{version}.gem"

    bin.install libexec/"bin/#{name}"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    system "false"
  end
end
