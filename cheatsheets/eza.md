# eza cheatsheet

Modern `ls` with colours, git status and tree view. Aliased in interactive shells only.

## Aliases

| Alias | Runs | Shows |
|---|---|---|
| `ls` | `eza --group-directories-first` | Names, folders first |
| `ll` | `eza -la --git --group-directories-first` | Long list, hidden files, git status column |
| `lt` | `eza --tree --level=2 --git-ignore` | 2-level tree, skips gitignored files |

## Useful flags

| Command | Action |
|---|---|
| `ll -s modified` | Sort by modified time (newest last) |
| `ll -s size` | Sort by size |
| `lt -L 4` | Deeper tree |
| `ll -D` | Directories only |
| `ll --total-size` | Include folder sizes (slow on big trees) |
| `eza --icons` | Add icons (needs a Nerd Font) |

## Git column (in `ll`)

`N` new, `M` modified, `D` deleted, `R` renamed, `I` ignored, `-` unchanged.

Bypass the alias: `\ls` or `command ls`.
