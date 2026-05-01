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
  url "https://github.com/conorluddy/Vestige/archive/refs/tags/v0.2.3.tar.gz"
  version "0.2.3"
  sha256 "85133561a9f0b1c9e393bc715d762994b10792d210ef8e1d65fd18ecd6c0cffb"
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
