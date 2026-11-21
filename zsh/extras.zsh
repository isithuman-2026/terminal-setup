# terminal-setup: zsh extras
# Source this near the END of ~/.zshrc (after oh-my-zsh is loaded):
#   source ~/terminal-setup/zsh/extras.zsh
# Every block is guarded, so a missing tool is skipped instead of breaking the shell.

# Neovim
alias v=nvim
export EDITOR=nvim

# bat (Ubuntu ships it as "batcat")
if command -v batcat >/dev/null; then
	alias cat='batcat --paging=never --style=plain'
	alias bat=batcat
fi

# eza (modern ls)
if command -v eza >/dev/null; then
	alias ls='eza --group-directories-first'
	alias ll='eza -la --git --group-directories-first'
	alias lt='eza --tree --level=2 --git-ignore'
fi

# fzf: Ctrl+R history, Ctrl+T files, Alt+C cd into dir
# Loaded after oh-my-zsh so it overrides zsh-autocomplete's Ctrl+R.
[[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]] && source /usr/share/doc/fzf/examples/key-bindings.zsh
if command -v fdfind >/dev/null; then
	export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --exclude .git'
	export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi

# zoxide: z <part of dir>, zi to pick interactively
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# starship prompt (keep last)
command -v starship >/dev/null && eval "$(starship init zsh)"
