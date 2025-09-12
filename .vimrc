let $CACHE = expand('~/.cache')
if !($CACHE->isdirectory())
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dir = 'dein.vim'->fnamemodify(':p')
  if !(s:dir->isdirectory())
    let s:dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !(s:dir->isdirectory())
      execute '!git clone https://github.com/Shougo/dein.vim' s:dir
    endif
  endif
  execute 'set runtimepath^='
        \ .. s:dir->fnamemodify(':p')->substitute('[/\\]$', '', '')
endif
set rtp+=$HOME/.vim
set rtp+=$HOME/.config/vim
runtime! plugin/**/*.vim
so $HOME/.vim/autoload/plug.vim
" so $HOME/.vim/autoload/pathogen.vim
so $HOME/.config/vim/opts.vim
so $HOME/.config/vim/maps.vim
let g:ayucolor = 'mirage'
so $HOME/.config/vim/plugin.vim
so $HOME/.config/vim/init.vim
so $HOME/.config/vim/coc.vim
set autowriteall
set autoindent

let b:copilot_enabled = v:false
let b:codeium_enabled = v:true
