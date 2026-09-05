if command -v tmux >/dev/null; then
  alias tn='tmux --new-session -s'
  alias ta='tmux attach-session'
  alias tl='tmux list-sessions'
fi
