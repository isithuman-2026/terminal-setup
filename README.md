# terminal-setup

Neovim and a faster, friendlier zsh for a headless Ubuntu server.

This repo documents a terminal setup for Ubuntu 24.04 over SSH: Neovim 0.12 with a trimmed copy of [Chris Titus's config](https://github.com/ChrisTitusTech/neovim), plus zsh extras (fzf, zoxide, eza, bat, starship). It is for anyone on a server with no desktop who wants a modern editor and shell without breaking scripts or slowing startup. Each tool has a one-page cheatsheet in [`cheatsheets/`](cheatsheets/).

## Setup

| Step | What | Needs sudo |
|---|---|---|
| 1 | Install packages | yes |
| 2 | Install Neovim 0.12 | no |
| 3 | Install the Neovim config and trim it | no |
| 4 | Install starship | no |
| 5 | Wire up zsh | no |
| 6 | First launch | no |

### 1. Packages

```bash
sudo apt update
sudo apt install -y ripgrep fd-find fzf xclip python3-venv luarocks golang-go shellcheck webp nodejs npm make zoxide eza bat
sudo npm install -g markdownlint-cli2
```

`markdownlint-cli2` prints `EBADENGINE` warnings on Ubuntu's Node 18. It still works. Install Node 22 if a later version stops running.

### 2. Neovim 0.12

Ubuntu 24.04's apt package is 0.9, too old for this config. Install the official release into `~/.local`:

```bash
mkdir -p ~/.local/opt ~/.local/bin
cd ~/.local/opt
curl -fsSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz && rm nvim-linux-x86_64.tar.gz
ln -sf ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
nvim --version | head -1
```

`~/.local/bin` must be on `PATH` ahead of `/usr/bin`.

### 3. Neovim config

The upstream Quick Start clones straight into `~/.config/nvim`, but the config lives in the `titus-kickstart/` subfolder, so Neovim would load nothing. Clone it elsewhere and symlink the subfolder:

```bash
git clone https://github.com/ChrisTitusTech/neovim ~/.local/share/titus-neovim
ln -s ~/.local/share/titus-neovim/titus-kickstart ~/.config/nvim
mkdir -p ~/.vim/undodir
```

Then apply the trim patch from this repo:

```bash
git -C ~/.local/share/titus-neovim apply /path/to/terminal-setup/nvim/trim-plugins.patch
```

The patch was made against upstream commit `8d48af2`. If it no longer applies, make the same changes by hand from the table below.

| Removed | Why |
|---|---|
| `vim-wakatime` | Coding-time tracker; needs a wakatime.com account and nags for an API key |
| `lsp-grammarly` | Grammar checking for prose; not needed for code and config |
| `Ionide-vim` | F# language support |
| `copilot.lua`, `CopilotChat.nvim`, `blink-cmp-copilot`, `plenary.nvim` | Need a paid GitHub Copilot subscription |
| `auto-save.nvim` | Saves on leaving insert mode, so half-finished config edits hit disk and services that watch files reload broken config |
| `img-clip.nvim` and its `<leader>p` keymap | Pastes clipboard images into Markdown; useless on a headless server |

Skip the upstream `lin-depend.sh`: it also installs the apt `neovim` (0.9).

### 4. Starship

```bash
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y
```

### 5. zsh

Add to the end of `~/.zshrc`:

```bash
source /path/to/terminal-setup/zsh/extras.zsh
```

If you use oh-my-zsh, set `ZSH_THEME=""` so its theme does not fight starship.

Optional speed-ups if you use nvm or pyenv, measured at 0.64s down to 0.14s startup:

- **nvm:** do not source `nvm.sh` at startup. Put the default Node on `PATH` and load nvm only when called:

  ```bash
  export NVM_DIR="$HOME/.nvm"
  [[ -d $NVM_DIR/versions/node ]] && export PATH="$(print -l $NVM_DIR/versions/node/*(/On[1]))/bin:$PATH"
  nvm() { unfunction nvm; source "$NVM_DIR/nvm.sh"; nvm "$@"; }
  ```

- **pyenv:** keep only `eval "$(pyenv init -)"`. The extra `pyenv init --path` line is redundant.

### 6. First launch

```bash
exec zsh
v
```

Plugins install themselves on the first launch.

## What you get

### Editor

- `v` opens Neovim, and `EDITOR` is set to `nvim`
- Fuzzy file and text search, LSP, completion, git signs and a file manager. See [cheatsheets/neovim.md](cheatsheets/neovim.md)

### Shell

| Tool | Replaces | Cheatsheet |
|---|---|---|
| fzf | Ctrl+R history search, manual file paths | [fzf.md](cheatsheets/fzf.md) |
| zoxide | `cd` with long paths | [zoxide.md](cheatsheets/zoxide.md) |
| eza | `ls` | [eza.md](cheatsheets/eza.md) |
| bat | `cat` | [bat.md](cheatsheets/bat.md) |
| starship | oh-my-zsh theme | [starship.md](cheatsheets/starship.md) |

Aliases apply to interactive shells only, so scripts still get the real `cat` and `ls`. To bypass one in the terminal, use `\cat` or `command ls`.

## License

MIT. See [LICENSE](LICENSE).
