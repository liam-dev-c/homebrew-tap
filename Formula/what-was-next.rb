class WhatWasNext < Formula
  desc "Terminal task manager and time tracker"
  homepage "https://github.com/liam-dev-c/what-was-next"
  version "2026-07-10-2"

  on_macos do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-10-2/what-was-next-darwin-arm64"
      sha256 "c86b02a5282dae2ce5e0187e87af7076fecc1fe8d3fdb79925be4195224ec4cd"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-10-2/what-was-next-darwin-amd64"
      sha256 "7cbc828004b2a8a8e81d604bb4f04797d43b52c8156e57b93630764fc42823fd"
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
