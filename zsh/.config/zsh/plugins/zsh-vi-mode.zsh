# Очищаем привязки и создаем пустой контекст
ZVM_LAZY_KEYBINDINGS=false

bindkey -N empty main
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Настройки плагина
ZVM_SYSTEM_CLIPBOARD_ENABLED=true

# DISABLE some keybinds
function zvm_after_init() {
  # normal mode
  bindkey -M vicmd -r '^P'
  bindkey -M vicmd -r '^N'
  bindkey -M vicmd -r '^_'
  bindkey -M vicmd -r ':'

  # insert mode
  bindkey -M viins -r '^P'
  bindkey -M viins -r '^N'
  bindkey -M viins -r '^_'
}

# reinitialize fzf binds
if command -v fzf >/dev/null; then
    zvm_after_init_commands+=('source <(fzf --zsh)')
fi
