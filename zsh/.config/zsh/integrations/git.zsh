if command -v git >/dev/null; then
  alias g="git"

  alias gi="git init"
  alias gcl="git clone"
  alias gs="git status --short"

  alias gd="git diff --output-indicator-new=' ' --output-indicator-old=' '"
  alias gdt="git difftool"

  alias ga="git add"
  alias gap="git add --patch"
  alias gc="git commit"
  alias gcm="git commit -m"

  alias gp="git push"
  alias gu="git pull"

  alias gl='git log --all --graph --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(auto) %D%n%s%n"'

  alias gb="git branch"
fi

# lazygit
if command -v lazygit >/dev/null; then
  alias lg="lazygit"
fi
