# bindkey '^L' autosuggest-accept

clear-terminal() {
  tput reset
  zle redisplay
}
zle -N clear-terminal
bindkey '^L' clear-terminal  # Ctrl+L
