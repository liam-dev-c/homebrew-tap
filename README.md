# homebrew-tap

Homebrew tap for [what-was-next](https://github.com/liam-dev-c/what-was-next) — a
terminal task manager and time tracker. macOS only (Apple Silicon + Intel).

## Install

```bash
brew install liam-dev-c/tap/what-was-next
```

## Updating the formula on each release

Releases use date-based tags (`YYYY-MM-DD-N`) and attach macOS binaries. After a
new release, bump `Formula/what-was-next.rb`:

- `version` → the new tag
- both `url`s → the new tag
- both `sha256`s → the asset digests shown on the GitHub release page
  (the `sha256:` value under each asset)
