# fzf cheatsheet

Fuzzy finder. Type any part of what you want, in any order.

## Shell keys

| Key | Action |
|---|---|
| `Ctrl+R` | Search command history, Enter puts it on the prompt |
| `Ctrl+T` | Pick a file and insert its path at the cursor |
| `Alt+C` | Pick a directory and `cd` into it |

## Inside the picker

| Key | Action |
|---|---|
| `Ctrl+j` / `Ctrl+k` or arrows | Move down / up |
| `Tab` | Mark multiple items (Ctrl+T) |
| `Enter` / `Esc` | Accept / cancel |

## Search syntax

| Pattern | Matches |
|---|---|
| `dock comp` | Both words, any order (fuzzy) |
| `'exact` | Exact substring |
| `^start` | Starts with |
| `.yml$` | Ends with |
| `!test` | Excludes |
| `a \| b` | Either |

## Handy one-liners

```bash
v $(fzf)                                  # open a picked file in Neovim
fzf --preview 'batcat --color=always {}'  # browse files with preview
docker ps --format '{{.Names}}' | fzf     # pick a container name
```
