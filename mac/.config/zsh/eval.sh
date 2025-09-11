function eval+() {
  echo "eval \"$($1)\"" >>~/.config/zsh/eval.sh
}

eval "$(starship init zsh)"
eval "$(navi widget zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate --shims zsh)"
