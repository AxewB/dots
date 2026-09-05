alias se="sudoedit"
# alias nvim="bob run nightly"

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# helix
alias hx='helix'

# flavours config
alias minsh_flavours="flavours -d $HOME/.local/share/minsh/config/flavours/data -c $HOME/.local/share/minsh/config/flavours/config.toml"

# clear
alias cl="clear"

# call fd and fzf to cd into directory
alias cddir='cd "$(fd --type directory | fzf)"'
