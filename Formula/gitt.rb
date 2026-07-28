# Homebrew formula for gitt, published to the DanielKag/homebrew-gitt tap by the release workflow in
# DanielKag/gitt, which fills in the version, archive name, and checksum placeholders below:
#
#   brew tap DanielKag/gitt && brew install gitt
#
# The download is one macOS universal binary (arm64 + x86_64), so there is no per-arch branching.
class Gitt < Formula
  desc "Interactive git TUI: fuzzy log, staging, diffs, and branches"
  homepage "https://github.com/DanielKag/gitt"
  url "https://github.com/DanielKag/gitt/releases/download/v0.1.0/gitt-0.1.0-macos-universal.tar.gz"
  sha256 "8b5c03d77c090488cfca8cb3cb6b4e8a4d207bbaa5da607a5af375c72828e55a"
  license "MIT"
  version "0.1.0"

  depends_on :macos

  def install
    bin.install "gitt"
  end

  test do
    assert_match "gitt #{version}", shell_output("#{bin}/gitt --version")
    # Outside a repository every subcommand must fail loudly instead of opening a TUI.
    output = shell_output("#{bin}/gitt log 2>&1", 1)
    assert_match "not a git repository", output
  end
end
