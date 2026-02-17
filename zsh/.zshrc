# plugins=(
#   git
#   zsh-autosuggestions
#   zsh-syntax-highlighting
# )

# Enable Zsh autocompletion system
autoload -Uz compinit && compinit

# Load the completion list module
zmodload zsh/complist

# Enable colored output for the completion menu
zstyle ':completion:*' list-colors ""

# Enable arrow-key navigation for the completion menu
zstyle ':completion:*' menu select

# Enable plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# PATH=~/.console-ninja/.bin:$PATH
PATH=~/.local/bin/:$PATH

# bun completions
# [ -s "/home/nchartiot/.bun/_bun" ] && source "/home/nchartiot/.bun/_bun"

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# Aliases
alias zed=zeditor
alias yeet="yay -Rns"
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'     # Detailed list view
alias la='ls -A --color=auto'     # Show hidden files
alias l='ls -CF --color=auto'     # Column format with indicators (adds / to folders, * to scripts)
