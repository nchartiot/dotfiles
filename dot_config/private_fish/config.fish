if status is-interactive
  # Aliases
  alias yeet='yay -Rns'
  
  # Themes
  fish_config theme choose catppuccin-mocha
  
  # Autostart
  if uwsm check may-start && uwsm select; then
  	exec uwsm start default
  end

  zoxide init fish | source
  starship init fish | source
end
