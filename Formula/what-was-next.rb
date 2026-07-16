class WhatWasNext < Formula
  desc "Terminal task manager and time tracker"
  homepage "https://github.com/liam-dev-c/what-was-next"
  version "2026-07-16-2"

  on_macos do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-2/what-was-next-darwin-arm64"
      sha256 "ca038c6da0c9c0d46a3b05c4be99360bc0f30ba6664595f9b2b38ba4e7d25c69"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-2/what-was-next-darwin-amd64"
      sha256 "abc204012fed0291d8734b2870a60644cef7c52d3633f475db8b148a9e6995b4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-2/what-was-next-linux-arm64"
      sha256 "4063da14d033bc1fbbb540033a2eeb9768235525c54e4ee70eb854f68c3c6e62"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-16-2/what-was-next-linux-amd64"
      sha256 "bc82550e6fac153d97a052a3d1a6d04c790b358b9ff63f9e03c2b012b210e985"
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
