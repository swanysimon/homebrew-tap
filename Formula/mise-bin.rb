class MiseBin < Formula
  desc "Polyglot runtime manager (asdf rust clone), installed from upstream binaries"
  homepage "https://mise.jdx.dev/"
  url "https://github.com/jdx/mise/releases/download/v2026.11.14/install.sh"
  sha256 "ef67c7eb5845bd1332b6adc07bbf044a3ae10acdd4e8281a9ad6ba035205d101"
  license "MIT"

  livecheck do
    url "https://github.com/jdx/mise"
    strategy :github_latest
  end

  conflicts_with "mise", because: "both install the same `mise` binary"

  def install
    # AIDEV: the script picks the right release asset per arch and checks it against
    # a checksum baked into this pinned script, so there is nothing to verify here.
    # It needs network access at build time, unlike a normal formula.
    ENV["MISE_INSTALL_PATH"] = bin/"mise"
    ENV["MISE_VERSION"] = "v#{version}"
    system "sh", "install.sh"

    lib.mkpath
    touch lib/".disable-self-update"
    (share/"fish/vendor_conf.d/mise-activate.fish").write <<~FISH
      if [ "$MISE_FISH_AUTO_ACTIVATE" != "0" ]
        #{opt_bin}/mise activate fish | source
      end
    FISH

    generate_completions_from_executable(bin/"mise", "completion")
  end

  def caveats
    "If you are using fish shell, mise will be activated for you automatically."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mise --version")

    (testpath/"mise.toml").write <<~TOML
      [tools]
      usage = "latest"
    TOML
    assert_match "usage", shell_output("#{bin}/mise ls")
  end
end
