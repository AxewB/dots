# clearing bindings to use vi mode plugin without any interference between default vi mode in zsh and plugin
bindkey -N empty main
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
ZVM_SYSTEM_CLIPBOARD_ENABLED=true # Use system clipboard
# ZVM_CURSOR_STYLE_ENABLED=false # always block cursor

# reinitialize fzf binds for them to work in vi insert mode
if command -v fzf >/dev/null; then
  zvm_after_init_commands+=('source <(fzf --zsh)')
fi


# zinit ice wait"0" lucid
zinit light kutsan/zsh-system-clipboard

# zinit ice wait"0" lucid
zinit light zsh-users/zsh-autosuggestions

# zinit ice wait"0" lucid
zinit light zdharma-continuum/fast-syntax-highlighting

