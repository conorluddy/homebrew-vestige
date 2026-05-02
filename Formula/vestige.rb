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
  url "https://github.com/conorluddy/Vestige/archive/refs/tags/v0.2.8.tar.gz"
  version "0.2.8"
  sha256 "62f34e104ea412cecb50db1ab9cddabcc91bbc1196a69e2afc4e30ac7b63ebe4"
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
