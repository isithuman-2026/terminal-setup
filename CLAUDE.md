# CLAUDE.md

Public docs repo: Neovim + zsh terminal setup for headless Ubuntu 24.04, with one cheatsheet per tool.

## Layout

- `README.md`: setup steps (table + commands) and feature overview
- `zsh/extras.zsh`: guarded zsh snippet, sourced at the end of `~/.zshrc`
- `nvim/trim-plugins.patch`: removes unused plugins from upstream ChrisTitusTech/neovim (made against `8d48af2`)
- `cheatsheets/*.md`: one page per tool (neovim, fzf, zoxide, eza, bat, starship)

## Rules

- Public repo: no hostnames, usernames, home paths, IPs, emails or tokens in any file or commit.
- Commit email: GitHub noreply address for isithuman-2026.
- Plain technical English, no em dashes, no emoji.
- Generate the patch with raw `git diff` (bypass any output-filtering proxy) and check it with `git apply --check` against a clean upstream clone.

## Documentation Maintenance

- Adding a tool: add its block to `zsh/extras.zsh`, a row to the README "Shell" table and package list, and a new `cheatsheets/<tool>.md`.
- Changing Neovim keymaps or plugins: regenerate the patch, update the README "Removed" table and `cheatsheets/neovim.md`.
