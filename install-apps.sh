#!/bin/bash
#
# install-apps.sh — Bootstrap a fresh Arch Linux install with every package
# referenced in this dotfiles repo.
#
# Usage:
#   chmod +x install-apps.sh
#   ./install-apps.sh
#
# To customise, just edit the arrays below. Each category is its own array
# so you can comment out entire sections or individual packages easily.

set -euo pipefail

# ─── Colours ──────────────────────────────────────────────────────────────────

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Colour

info()  { echo -e "${BLUE}[INFO]${NC}  $*"; }
ok()    { echo -e "${GREEN}[ OK ]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
err()   { echo -e "${RED}[ERR ]${NC}  $*"; }

# ─── Ensure yay is available ──────────────────────────────────────────────────

install_yay() {
  if command -v yay &>/dev/null; then
    ok "yay is already installed"
    return
  fi

  info "Installing yay (AUR helper)…"
  sudo pacman -S --needed --noconfirm base-devel git

  local tmpdir
  tmpdir="$(mktemp -d)"
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si --noconfirm)
  rm -rf "$tmpdir"

  ok "yay installed"
}

# ─── Package Lists ────────────────────────────────────────────────────────────
# Edit these arrays to add/remove packages. yay handles both official repos
# and the AUR, so everything goes through `yay -S`.

# Hyprland desktop environment
hyprland_pkgs=(
  hyprlock
  hypridle
  hyprshot                      # AUR — region screenshots
  xdg-desktop-portal-hyprland
  xdg-desktop-portal
  xwayland
  uwsm                         # AUR — universal Wayland session manager
)

# Desktop shell, launcher & notifications
desktop_shell_pkgs=(
  quickshell                    # AUR — Noctalia shell runtime
  vicinae-bin                   # AUR — app launcher / emoji picker
  swaync                        # notification centre
)

# Terminal, shell & prompt
terminal_pkgs=(
  ghostty                       # AUR — terminal emulator
  zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  starship                      # cross-shell prompt
  zellij                        # terminal multiplexer
)

# CLI utilities
cli_pkgs=(
  zoxide                        # smarter cd
  fzf                           # fuzzy finder (used by nvim fzf extra)
  btop                          # process monitor
  lazygit                       # TUI git client
  lazydocker                    # TUI docker client
  television                    # AUR — file/text finder (used by Zed)
  stow                          # symlink manager for dotfiles
  opencode-bin                  # AI stuff
)

# Editors & IDE tools
editor_pkgs=(
  neovim
  zed-bin                       # AUR — Zed editor (binary: zeditor)
)

# Browsers
browser_pkgs=(
  zen-browser-bin               # AUR — primary browser
)

# Clipboard
clipboard_pkgs=(
  # wl-clipboard                  # wl-copy / wl-paste
  # cliphist                      # clipboard history
  # wl-clip-persist               # AUR — persist clipboard after app closes
)

# Input method
input_pkgs=(
  # fcitx5
)

# Authentication & security
auth_pkgs=(
  polkit-gnome
  fprintd                       # fingerprint (used by hyprlock)
)

# Networking
network_pkgs=(
  tailscale
)

# Theming & appearance
theme_pkgs=(
  ttf-jetbrains-mono-nerd       # JetBrainsMono Nerd Font
)

# Programming languages & runtimes
lang_pkgs=(
  git
  go
  fnm-bin                       # AUR — Node.js version manager
  bun-bin                       # AUR — JavaScript runtime
)

# ─── Install ──────────────────────────────────────────────────────────────────

install_yay

all_pkgs=(
  "${hyprland_pkgs[@]}"
  "${desktop_shell_pkgs[@]}"
  "${terminal_pkgs[@]}"
  "${cli_pkgs[@]}"
  "${editor_pkgs[@]}"
  "${browser_pkgs[@]}"
  "${media_pkgs[@]}"
  "${clipboard_pkgs[@]}"
  "${input_pkgs[@]}"
  "${auth_pkgs[@]}"
  "${network_pkgs[@]}"
  "${theme_pkgs[@]}"
  "${lang_pkgs[@]}"
  "${formatter_pkgs[@]}"
)

info "Installing ${#all_pkgs[@]} packages…"
yay -S --needed "${all_pkgs[@]}"
ok "All packages installed"

# ─── Post-install setup ──────────────────────────────────────────────────────

info "Running post-install steps…"

# Set Zsh as default shell
if [[ "$SHELL" != */zsh ]]; then
  info "Changing default shell to zsh…"
  chsh -s "$(which zsh)"
  ok "Default shell set to zsh (takes effect on next login)"
else
  ok "Default shell is already zsh"
fi

# Enable Tailscale
if systemctl is-enabled tailscaled &>/dev/null; then
  ok "tailscaled service already enabled"
else
  info "Enabling tailscaled service…"
  sudo systemctl enable --now tailscaled
  ok "tailscaled enabled and started"
fi

# ─── Done ─────────────────────────────────────────────────────────────────────

echo ""
ok "All done! Next steps:"
echo "  1. Run ./restore-dotfiles.sh to stow your configs"
echo "  2. Log out and back in for shell changes to take effect"
echo "  3. Launch Neovim — Mason will auto-install LSPs on first run"
