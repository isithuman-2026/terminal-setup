# Neovim cheatsheet

Leader key is **Space**. Press Space and wait to see every leader binding (which-key).

## Survival

| Key | Action |
|---|---|
| `i` / `a` / `o` | Insert before cursor / after cursor / on new line below |
| `Esc` or `jj` | Back to normal mode |
| `:w` / `:q` / `:wq` / `:q!` | Save / quit / save and quit / quit without saving |
| `:SudaWrite` | Save a root-owned file you opened without sudo |
| `u` / `Ctrl+r` | Undo / redo |
| `F5` | Undo history tree |

## Moving

| Key | Action |
|---|---|
| `h j k l` | Left, down, up, right |
| `w` / `b` | Next / previous word |
| `0` / `Space e` | Start / end of line |
| `gg` / `G` | Top / bottom of file |
| `Ctrl+d` / `Ctrl+u` | Half page down / up |
| `/text` then `n` / `N` | Search forward, next / previous match |
| `Esc` | Clear search highlight |

## Editing

| Key | Action |
|---|---|
| `dd` / `yy` / `p` | Delete (cut) line / copy line / paste |
| `ciw` | Change word under cursor |
| `v` / `V` | Visual select characters / lines |
| `>` / `<` (visual) | Indent / dedent, selection stays |
| `p` (visual) | Paste over selection without losing the clipboard |
| `S` | Search and replace in buffer (`:%s//g` prompt) |
| `gcc` / `Space /` (visual) | Toggle comment on line / selection |
| `Ctrl+n` | Multi-cursor: select next match of word |
| `Space y` | Yank the Markdown code block under the cursor |
| `Space =` | Format buffer |

## Finding things

| Key | Action |
|---|---|
| `Space Space` | Open buffers |
| `Space sf` / `Space ff` | Find files |
| `Space fg` | Grep text across project |
| `Space sw` | Grep word under cursor |
| `Space /` | Fuzzy search in current buffer |
| `Space s/` | Search in open files |
| `Space s.` | Recent files |
| `Space sr` | Resume last search |
| `Space sk` / `Space sh` | Search keymaps / help |
| `Space sd` | Diagnostics list |

## Files and windows

| Key | Action |
|---|---|
| `-` | Parent directory as editable buffer (oil): rename, delete, create by editing text, then `:w` |
| `Space o` | oil in a floating window |
| `Space fe` | File explorer tree |
| `Shift+l` / `Shift+h` | Next / previous buffer |
| `Space d` or `Shift+q` | Close buffer |
| `Ctrl+h j k l` | Move between splits |
| `:vsplit` / `:split` | Split vertical / horizontal |
| ``Ctrl+` `` | Toggle terminal in file's directory |
| `Esc Esc` | Leave terminal mode |
| `Space v` | Code outline |
| `Ctrl+\` | Zen mode |

## Code (LSP)

| Key | Action |
|---|---|
| `grd` / `grD` | Go to definition / declaration |
| `grr` | References |
| `gri` | Implementations |
| `grn` | Rename symbol |
| `gra` | Code action |
| `K` | Hover docs |
| `Space xx` | All diagnostics (Trouble) |
| `Space q` | Diagnostics to quickfix list |
| `:Mason` | Install or update language servers |

## Git

| Key | Action |
|---|---|
| `Space hp` | Preview hunk |
| `Space hs` / `Space hr` | Stage / reset hunk |
| `Space hS` / `Space hR` | Stage / reset whole buffer |
| `Space hb` | Blame line |
| `Space gb` | Toggle inline blame |
| `Space hd` | Diff file |

## Maintenance

| Command | Action |
|---|---|
| `:lua vim.pack.update()` | Update plugins |
| `:checkhealth` | Diagnose missing tools |
