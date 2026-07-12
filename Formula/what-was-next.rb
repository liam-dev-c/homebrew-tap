class WhatWasNext < Formula
  desc "Terminal task manager and time tracker"
  homepage "https://github.com/liam-dev-c/what-was-next"
  version "2026-07-12-1"

  on_macos do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-12-1/what-was-next-darwin-arm64"
      sha256 "0ffd5eee71a71dce01b942ccd672e36eb429868726be2f215f151e347b3de50b"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-12-1/what-was-next-darwin-amd64"
      sha256 "f34c004c01cf8511e2dfc259d1f4c8e14a32e514ebe278f7b2308b31c8843f94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-12-1/what-was-next-linux-arm64"
      sha256 "b232702f8f9485c64c1178b507f3986c7b88f8ad6142f7761ac265e159e287cd"
    end
    on_intel do
      url "https://github.com/liam-dev-c/what-was-next/releases/download/2026-07-12-1/what-was-next-linux-amd64"
      sha256 "d6f982f166cb6c33ecc4f05910d59e72b7c6a7b6fce12b916e8ca38a01e14d98"
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
