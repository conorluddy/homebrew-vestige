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
  url "https://github.com/conorluddy/Vestige/archive/refs/tags/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "94acac39285bf5e2cf972ba55fd3bece0b3ceac6acce07df0010f497bd7db8f6"
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
