# replacing find with fd if exists
if command -v fd >/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
fi
# start flavours
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"\
" --color=bg+:#3b393c,bg:#262427,spinner:#aee8f4,hl:#49cae4"\
" --color=fg:#7c7b7d,header:#49cae4,info:#ffca58,pointer:#aee8f4"\
" --color=marker:#aee8f4,fg+:#eae9eb,prompt:#ffca58,hl+:#49cae4"
# end flavours

if command -v fzf >/dev/null; then
  alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
  alias f='xdg-open "$(ff)"'
  alias nf='nvim $(ff)'
  alias fcd='cd $(fzf)'
  alias fenv='env | fzf'
fi

source <(fzf --zsh)
