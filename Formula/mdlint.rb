class Mdlint < Formula
  desc "Fast, opinionated Markdown formatter and linter"
  homepage "https://github.com/swanysimon/mdlint"
  url "https://github.com/swanysimon/mdlint/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "23ef8efd5bbefd68c4c5230c1119bda64e4c6d69ecca97377734121458af21d4"
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
