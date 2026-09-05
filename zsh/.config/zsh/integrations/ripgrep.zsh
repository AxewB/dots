# eza replaces ls if available
if command -v eza >/dev/null; then
  alias rgall=rg --hidden --no-ignore 
fi
