# zoxide cheatsheet

Smarter `cd`. It remembers directories you visit and ranks them by how often and how recently you used them.

| Command | Action |
|---|---|
| `z mon` | Jump to the best match for "mon", e.g. `/opt/monitoring` |
| `z opt mon` | Several words narrow it: path must contain both, in order |
| `z -` | Previous directory |
| `z ..` / `z /abs/path` | Works like normal `cd` too |
| `zi` | Pick from matches interactively (uses fzf) |
| `zoxide query -ls` | Show the ranked database with scores |
| `zoxide remove /path` | Forget a directory |

It only knows directories you have visited since installing it, so it gets more useful over a few days.
