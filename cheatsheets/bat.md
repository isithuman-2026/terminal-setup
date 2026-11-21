# bat cheatsheet

`cat` with syntax highlighting. Ubuntu installs it as `batcat`; `bat` is aliased to it.

| Command | Action |
|---|---|
| `cat file` | Highlighted, plain style, no pager (aliased) |
| `bat file` | Full view: line numbers, git changes, pager |
| `bat -n file` | Line numbers only |
| `bat -r 20:40 file` | Only lines 20 to 40 |
| `bat -l yaml` | Force a language, e.g. for piped input |
| `bat -A file` | Show hidden characters (tabs, CRLF, trailing spaces) |
| `docker compose config \| bat -l yaml` | Highlight piped output |
| `bat --list-themes` | Preview colour themes |

Set a theme: `export BAT_THEME="TwoDark"` in `~/.zshrc`.

Bypass the alias: `\cat` or `command cat`. Scripts are unaffected because aliases only apply in interactive shells.
