# starship cheatsheet

Fast prompt that shows context only when relevant: git branch and status inside repos, command run time over 2 seconds, exit code on failure, language versions in project folders.

## Reading the prompt

| Part | Meaning |
|---|---|
| `user in host` | Shown over SSH |
| `on  main` | Git branch |
| `[!?+]` after branch | `!` modified, `?` untracked, `+` staged, `⇡`/`⇣` ahead/behind |
| `took 5s` | Last command's run time |
| Red `❯` | Last command failed |

## Config

Config file: `~/.config/starship.toml` (does not exist until you create it; defaults apply).

| Command | Action |
|---|---|
| `starship explain` | Explain every part of the current prompt |
| `starship timings` | Find slow modules |
| `starship preset plain-text-symbols -o ~/.config/starship.toml` | No icons, if your font shows boxes |
| `starship preset nerd-font-symbols -o ~/.config/starship.toml` | Full Nerd Font icons |
| `starship print-config` | Show the active config |

Example tweaks in `~/.config/starship.toml`:

```toml
[cmd_duration]
min_time = 5_000      # only show durations over 5s

[hostname]
ssh_only = false      # always show host

[directory]
truncation_length = 4
```

Update: rerun the install command from the README.
