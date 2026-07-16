class WhatWasNext < Formula
  desc "Terminal task manager and time tracker"
  homepage "https://github.com/liam-dev-c/what-was-next"
  version "2026-07-16-1"

  on_macos do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-1/what-was-next-darwin-arm64"
      sha256 "a342444b37e5b1f7856fe56b97d9993211454b1aa3edab8db3b2fbe246c8fe0a"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-1/what-was-next-darwin-amd64"
      sha256 "b4f00a712d81e736b20df891f21fa1844c5708801f1239df7e986bde8f29eaaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-1/what-was-next-linux-arm64"
      sha256 "4dff95221d77cf23c8585b8228a36092ac033e505ac38e108d255709c936d6b7"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-1/what-was-next-linux-amd64"
      sha256 "c76aebe06126909934e1875062a2b6d7beb49a38dd9658ad04ae6ebc27a942a1"
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
