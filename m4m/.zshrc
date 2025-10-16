# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
eval "$(~/.local/bin/cursor-agent shell-integration zsh)"
export BP=$(brew --prefix)
# ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# [ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
# [ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# source "${ZINIT_HOME}/zinit.zsh"
# if type brew &>/dev/null; then
#   # FPATH=/opt/homebrew/share/zsh-completions:$FPATH
#   # autoload -Uz _zinit compinit; compinit
# fi
# # rm -rf ~/.zcompdump; compinit
export ZDOTDIR="$HOME/.config/zsh"
source "$ZDOTDIR/source.sh"
source "$ZDOTDIR/completion.sh"
source "$ZDOTDIR/plugin.sh"
source "$ZDOTDIR/eval.sh"
source "$ZDOTDIR/opts.sh"
source "$ZDOTDIR/path.sh"
source "$ZDOTDIR/alias.sh"
source "$ZDOTDIR/export.sh"
source "$ZDOTDIR/fn.sh"
source "$ZDOTDIR/overrides.sh"
source "$ZDOTDIR/ssh.sh"
source "$ZDOTDIR/cmd.sh"
source "$ZDOTDIR/maps.sh"
source "$ZDOTDIR/keys.sh"
# source /Users/clp/.config/broot/launcher/bash/br

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/clp/.lmstudio/bin"
export PATH="$PATH:/Users/clp/infra/.bin"
export PATH="$PATH:/Users/clp"
# End of LM Studio CLI section

# /Users/clp/

export PATH="$HOME/.local/bin:$PATH"

export INFRA_ROOT="/Users/clp/infra"
export HC_ROOT="/Users/clp/infra"
export PATH="/Users/clp/.pixi/bin:$PATH"
# export PATH="/Users/clp/"
# eval "$(vfox activate zsh)"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
