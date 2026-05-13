# Source-of-truth formula template for the conorluddy/homebrew-vestige tap.
#
# DO NOT install from this file directly — `version`, `url`, and `sha256` are
# placeholder tokens that the `release-tap` workflow substitutes on each
# tagged release before pushing to the tap repo.
#
# Users install via:  brew tap conorluddy/vestige && brew install vestige
class Vestige < Formula
  desc "Local-first, repo-pinned memory layer for coding agents"
  homepage "https://github.com/conorluddy/Vestige"
  url "https://github.com/conorluddy/Vestige/archive/refs/tags/v0.4.2.tar.gz"
  version "0.4.2"
  sha256 "81b72af9bf3dffadb03a69c38b3f5b71b4881d04fe44874c87ad1457ace0b777"
  license "MIT"
  head "https://github.com/conorluddy/Vestige.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/vestige-cli")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vestige --version")
  end
end
