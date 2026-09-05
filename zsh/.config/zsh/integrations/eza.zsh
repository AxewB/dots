# eza replaces ls if available
if command -v eza >/dev/null; then
  alias tree="eza --tree"
  alias ls='eza -l --icons=always --group-directories-first'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias la='ls -a'
  alias lta='lt -a'
  alias lc='eza --grid --icons=always --group-directories-first' # compact view
fi
