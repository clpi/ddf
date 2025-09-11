if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
zoxide init fish | source
navi widget fish | source
mise activate fish --shims | source

function aalias
    echo "alias $argv[1] '$argv[2..-1]'" >>~/.config/fish/aliases.fish
end

fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.deno/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Users/clp/.codeium/bin
fish_add_path $HOME/.gem/bin
fish_add_path $HOME/.wasmer/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/go/bin
fish_add_path /usr/bin
fish_add_path /usr/sbin
fish_add_path /bin
fish_add_path /sbin
fish_add_path /Volumes/d/Applications/love.app/Contents/MacOS
fish_add_path /Volumes/d/bin/flutter/bin
fish_add_path /Users/clp/d/Applications/Ollama.app/Contents/MacOS

alias ef "nvim ~/.config/fish/config.fish"
alias sf "source ~/.config/fish/config.fish"

source ~/.config/fish/aliases.fish
