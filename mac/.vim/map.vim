
nno ; :
cmap <c-a> <home>
cmap <c-e> <end>
cmap <c-b> <left>
cmap <c-f> <right>

  nno 0 ^
set clipboard=unnamedplus
set guifont=ZedMono\ Nerd\ Font:h12
set linespace=0
imap ,. <ESC>
imap \\ <ESC>
nno <C-h> <C-w>h
nno <C-j> <C-w>j
nno <C-k> <C-w>k
nno <C-l> <C-w>l
nno ,cd <CMD>cd %:p:h<CR>
nno ,cm <CMD>CocList marketplace<CR>
nno <space>e <CMD>CocCommand explorer<CR>
nno ,C <CMD>CocConfig<CR>
nno ,L <CMD>CocList<CR>
nno ,v <CMD>e ~/.vimrc<CR>
nno H <CMD>bp<CR>
nno L <CMD>bn<CR>
