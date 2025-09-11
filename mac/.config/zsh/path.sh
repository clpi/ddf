# Add a path
function path+() {
  echo -e "export PATH=$1:$PATH" >>/Users/clp/.config/zsh/path.sh
}

export PATH="$PATH:/Users/clp/.config/emacs/bin"
export PATH="$PATH:$HOME/.deno/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"
export PATH="$PATH:$HOME/.bun/bin"
export PATH="$PATH:$HOME/.lein/bin"
export PATH="$PATH:$HOME/d/Applications/love.app/Contents/MacOS"
export PATH="$PATH:$HOME/d/bin/flutter/bin"
export PATH="$PATH:$HOME/.gem/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.codeium/bin"
export PATH="$PATH:$HOME/d/Applications/Ollama.app/Contents/MacOS"
export PATH="$PATH:$HOME/.wasmer/bin"
alias -g ~a=~/a
alias -g ~d=~/d
alias -g ~b=~/b
alias -g ~c=~/c

#vim:ft=bash
