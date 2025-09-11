# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
source "$HOME/.config/zsh/eval.sh"
source "$HOME/.config/zsh/opts.sh"
source "$HOME/.config/zsh/overrides.sh"
source "$HOME/.config/zsh/export.sh"
source "$HOME/.config/zsh/alias.sh"
source "$HOME/.config/zsh/path.sh"
source "$HOME/.config/zsh/source.sh"
source "$HOME/.config/zsh/keys.sh"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

# Added by Windsurf
export PATH="/Users/clp/.codeium/windsurf/bin:$PATH"
export PATH="/Users/clp/.pixi/bin:$PATH"

# Wasmer
export WASMER_DIR="/Users/clp/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/clp/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# bun completions
[ -s "/opt/homebrew/share/zsh/site-functions/_bun" ] && source "/opt/homebrew/share/zsh/site-functions/_bun"
