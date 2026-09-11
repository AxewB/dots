# Disabling case-sensitivity for TAB autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|?=**' 'l:|=*' 'r:|=*'
