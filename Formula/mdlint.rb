class Mdlint < Formula
  desc "Fast, opinionated Markdown formatter and linter"
  homepage "https://github.com/swanysimon/mdlint"
  url "https://github.com/swanysimon/mdlint/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "569376ef89161a74f210be7c6cbdb29a43a902e7897142e1c6f6ad4bd0ee5b0c"
  license "Unlicense"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mdlint --version")
  end
end
