class WhatWasNext < Formula
  desc "Terminal task manager and time tracker"
  homepage "https://github.com/liam-dev-c/what-was-next"
  version "2026-07-11-2"

  on_macos do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-11-2/what-was-next-darwin-arm64"
      sha256 "daadc26264e00ca3e7ca8e7a0c1f8b29a464e05bc09f8d866e37ad58582f1d22"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-11-2/what-was-next-darwin-amd64"
      sha256 "473be1b72c6be0b0d691a79321be862f02b3ab0b32f9af4715064a1e9aa668d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-11-2/what-was-next-linux-arm64"
      sha256 "36637b680b9f2f75b573dddc6c13c30ca28846a11a4c82123d196732e7063a0b"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-11-2/what-was-next-linux-amd64"
      sha256 "911d4fab4fa3f09f326ca8b1e50e0b956e82961193f7832bf0bdf607a80b0081"
    end
  end

  def install
    # Only the single OS/arch-matched binary is downloaded; install it as `what-was-next`.
    bin.install Dir["what-was-next-*"].first => "what-was-next"
  end

  test do
    # No TTY in the Homebrew test sandbox, so the TUI exits non-zero on startup.
    # That still exercises the binary end-to-end and confirms it's the right program.
    output = shell_output("#{bin}/what-was-next < /dev/null 2>&1", 1)
    assert_match "what-was-next:", output
  end
end
