class WhatWasNext < Formula
  desc "Terminal task manager and time tracker"
  homepage "https://github.com/liam-dev-c/what-was-next"
  version "2026-07-11-1"

  on_macos do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-11-1/what-was-next-darwin-arm64"
      sha256 "3823641fccb30b33622614573c7ae7ed65ef1796361d7d3bb3e5d063d4f1de1b"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-11-1/what-was-next-darwin-amd64"
      sha256 "a57e14429e8cee31d7185a0aad3319c425120d788b8f429ca4ec0de099a67342"
    end
  end

  def install
    # Only the single arch-matched binary is downloaded; install it as `what-was-next`.
    bin.install Dir["what-was-next-darwin-*"].first => "what-was-next"
  end

  test do
    # No TTY in the Homebrew test sandbox, so the TUI exits non-zero on startup.
    # That still exercises the binary end-to-end and confirms it's the right program.
    output = shell_output("#{bin}/what-was-next < /dev/null 2>&1", 1)
    assert_match "what-was-next:", output
  end
end
