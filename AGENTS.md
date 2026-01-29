# AGENTS.md - Dotfiles Repository

This is a personal dotfiles repository for an Arch Linux system using GNU Stow for symlink management. The configurations target a Wayland-based desktop environment with Hyprland as the window manager.

## Repository Structure

This repository uses GNU Stow to symlink configuration files to `~/.config/`. Each top-level directory represents an application, containing the path structure that mirrors the target location from home.

```
dotfiles/
├── ghostty/          # Terminal emulator (.config/ghostty/)
├── hypr/             # Hyprland window manager (.config/hypr/)
├── nvim/             # Neovim with LazyVim (.config/nvim/)
├── opencode/         # AI coding assistant (.config/opencode/)
├── starship/         # Shell prompt (.config/starship.toml)
├── swaync/           # Notification center (.config/swaync/)
├── waybar/           # Status bar (.config/waybar/)
├── zed/              # Zed editor (.config/zed/)
├── zellij/           # Terminal multiplexer (.config/zellij/)
├── zsh/              # Shell config (.zshrc)
├── restore-dotfiles.sh
└── save-dotfiles.sh
```

## Commands

### Stow/Restore Dotfiles
```bash
./restore-dotfiles.sh    # Stow all configs to home directory
stow -v <app-name>       # Stow a single application's config
stow -D <app-name>       # Unstow (remove symlinks) for an application
```

### Save Changes
```bash
./save-dotfiles.sh       # Stage, commit ("Update dotfiles"), and push
```

### Formatting
```bash
stylua <file.lua>        # Format Lua files (Neovim configs)
```

**Note:** This is a configuration repository - there are no build, lint, or test commands.

## Code Style Guidelines

### Directory Structure Convention
- Each application has its own top-level directory
- Inside, the path structure mirrors the target from `$HOME`
- Example: `nvim/.config/nvim/` stows to `~/.config/nvim/`
- Skip the `LEGACY/` directory when stowing

### Lua (Neovim/LazyVim)
- **Indentation:** 2 spaces (per stylua.toml)
- **Line width:** 120 characters max
- **Comments:** Use `--` prefix
- **Plugin format:** LazyVim spec with `return {}` tables
- **Formatter:** stylua

Example plugin spec:
```lua
return {
  {
    "plugin/name",
    opts = {
      setting = "value",
    },
  },
}
```

### Shell Scripts (Bash)
- Always include shebang: `#!/bin/bash`
- Check preconditions early (e.g., verify `.git` directory exists)
- Use `$HOME` or `~` for home directory references
- Provide clear echo messages for user feedback
- Quote variables: `"$dir"` not `$dir`

### Hyprland Configuration
- **Main config:** `hyprland.conf` sources modular files
- **Modular configs in:** `hyprland/` subdirectory
  - `monitors.conf` - Display configuration
  - `input.conf` - Input device settings
  - `bindings.conf` - Keybindings
  - `autostart.conf` - Startup applications
  - `windows.conf` - Window rules
  - `env.conf` - Environment variables
- **Variables:** Use `$varname = value` syntax
- **Bindings:** Use `bindd` for documented bindings, `bind` for simple ones
- **Comments:** Use `#` prefix

### JSON/JSONC Configuration
- Use JSONC (JSON with comments) where supported
- Comments with `//` prefix
- Keep formatting consistent with existing files

### TOML Configuration (Starship)
- Use schema reference when available
- Organize sections with `[section]` headers
- Use single quotes for strings

### KDL Configuration (Zellij)
- Use `//` for comments
- Organize keybinds by mode
- Use descriptive binding names

### CSS (Waybar, SwayNC)
- Use Catppuccin Mocha color palette
- Keep selectors specific to avoid conflicts
- Comment sections for organization

## Theme Consistency

**All configurations use Catppuccin Mocha theme:**
- Neovim: `catppuccin` colorscheme with `flavour = "mocha"`
- Ghostty: `theme = catppuccin-mocha.conf`
- Starship: `palette = "catppuccin_mocha"`
- Zellij: `theme "catppuccin-mocha"`
- Zed: Catppuccin Mocha theme
- Hyprland: Sources `mocha.conf` for colors

**Font:** JetBrainsMono Nerd Font (12pt for terminal)

## Key Applications

| Application | Purpose | Config Location |
|-------------|---------|-----------------|
| Hyprland | Wayland compositor/WM | `hypr/.config/hypr/` |
| Ghostty | Terminal emulator | `ghostty/.config/ghostty/` |
| Neovim | Text editor (LazyVim) | `nvim/.config/nvim/` |
| Zellij | Terminal multiplexer | `zellij/.config/zellij/` |
| Waybar | Status bar | `waybar/.config/waybar/` |
| Starship | Shell prompt | `starship/.config/starship.toml` |
| SwayNC | Notification center | `swaync/.config/swaync/` |
| Zed | GUI code editor | `zed/.config/zed/` |
| OpenCode | AI coding assistant | `opencode/.config/opencode/` |

## Common Tasks

### Adding a New Application Config
1. Create directory: `mkdir -p <app>/.config/<app>/`
2. Add config files to mirror the target structure
3. Run `stow -v <app>` to symlink

### Modifying Hyprland Keybindings
Edit `hypr/.config/hypr/hyprland/bindings.conf`. Use `bindd` for documented bindings:
```
bindd = SUPER, return, Terminal, exec, $terminal
```

### Adding Neovim Plugin
Create a new file in `nvim/.config/nvim/lua/plugins/`:
```lua
return {
  {
    "author/plugin-name",
    opts = {},
  },
}
```

### Updating Waybar
- Config: `waybar/.config/waybar/config.jsonc`
- Styles: `waybar/.config/waybar/style.css`

## Environment Details
- **OS:** Arch Linux
- **Package Manager:** `yay` (AUR helper)
- **Shell:** Zsh with Oh My Zsh
- **Node Manager:** fnm
- **Directory Navigation:** zoxide
- **Useful alias:** `yeet` = `yay -Rns` (remove package)
