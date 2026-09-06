# eza replaces ls if available
if command -v eza >/dev/null; then
  alias tree="eza --tree"
  alias ll='eza -l --icons=always --group-directories-first' # long
  alias lt='eza --tree --level=3 --icons --git'
  alias la='ls -a'
  alias lta='lt -a'
  alias ls='eza --grid --icons=always --group-directories-first' # compact view
fi
