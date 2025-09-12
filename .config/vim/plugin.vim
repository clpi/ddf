set nowarn noconfirm nocompatible
nno ,vm <CMD>e ~/.config/vim/maps.vim<CR>

call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'psliwka/vim-smoothie'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'luzhlon/xmake.vim', { 'for': ['xmake', 'xmake.lua']}
Plug 'vimwiki/vimwiki', { 'branch': 'dev'}

Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact', 'typescript.tsx'] }
Plug 'alaviss/nim.nvim', { 'for': 'nim'}
Plug 'NoahTheDuke/vim-just', { 'for': 'just' }
Plug 'tpope/vim-markdown', { 'for': 'markdown'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go', 'gomod', 'gowork', 'gotmpl'] }

Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'lotabout/skim.vim'
Plug 'junegunn/fzf.vim'

" Plug 'sainnhe/everforest'
Plug 'ayu-theme/ayu-vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'

Plug 'itchyny/calendar.vim'

Plug 'godlygeek/tabular'
Plug 'vim-test/vim-test'
Plug 'ryanoasis/vim-devicons'

Plug 'github/copilot.vim'
Plug 'exafunction/codeium.vim'
Plug 'exafunction/windsurf.vim'
Plug 'ggml-org/llama.vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-rhubarb', { 'for': 'ruby'}
call plug#end()

" Vim which key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:llama_config = {
  \ 'keymap_accept_full': '<C-y>',
  \ 'show_info': 0,
  \ 'auto_fim': 0,
  \ }
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500


let g:codeium_disable_bindings=1

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
let g:lightline = {
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'close' ] ]
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \   'middle': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \ },
      \ 'component_expand': {
      \   'readonly': 'lightline#readonly',
	    \ 'tabs': 'lightline#tabs'
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ 'colorscheme': 'ayu_mirage',
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
      \ }
      \ }

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" Path completion with custom source command
inoremap <expr> <c-f><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-f><c-g> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
inoremap <expr> <c-f><c-w> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})





" Replace the default dictionary completion with fzf-based fuzzy completion
inoremap <expr> <c-f><c-d> fzf#vim#complete('cat /usr/share/dict/words')
" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-f><c-l> fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--ansi --delimiter : --nth 3..',
  \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

nno ,cm <CMD>CocList marketplace<CR>
nno <space>cm <CMD>CocList marketplace<CR>
nno ,C <CMD>CocConfig <CR>
nno <c-e> <CMD>CocCommand explorer<CR>
nno <space>e <CMD>CocCommand explorer<CR>
nmap 0 ^



  nno ,<space>f <CMD>Files<CR>
  nno <space>fr <CMD>Rg<CR>
  nno <space>fo <CMD>History<CR>
  nno <space>fa <CMD>Ag<CR>
nno <space>fh <CMD>Helptags<CR>


nno ,cd <CMD>CocList diagnostics<CR>

nno <space>cd <CMD>CocCommand fzf-preview.CocDiagnostics<CR>
nno <space>cd <CMD>CocCommand fzf-preview.CocReferences<CR>

" set browsedir=buffer
let g:codeium_enabled = v:true

nnoremap <silent> <leader> :WhichKey '<space>'<CR>
" set timeoutlen=500

cabbrev cl CocList
cabbrev ca CocAction
cabbrev cc CocCommand
cabbrev ci CocInstall
cabbrev cu CocUpdate

nmap <silent> <localleader>t :TestNearest<CR>
nmap <silent> <localleader>T :TestFile<CR>
nmap <silent> <localleader>a :TestSuite<CR>
nmap <silent> <localleader>l :TestLast<CR>
nmap <silent> <localleader>g :TestVisit<CR>


let g:vimwiki_use_calendar=1
let g:vimwiki_list = [
  \ {
  \   'path': '/Users/clp/Library/Mobile Documents/com~apple~CloudDocs/wiki',
  \   'syntax': 'markdown',
  \   'ext': '.md',
  \ },
  \ {
  \   'path': '/Users/clp/.clp',
  \   'syntax': 'markdown',
  \   'ext': '.md',
  \ },
  \ {
  \   'path': '/Users/clp/notes',
  \   'syntax': 'markdown',
  \   'ext': '.md',
  \ },
  \ {
  \   'path': '/Users/clp/wiki',
  \   'syntax': 'markdown',
  \   'ext': '.md',
  \ },
  \]

lua <<EOF
EOF

