nno ; :
nno <space><cr> <cmd>cd %:p:h<CR>
nno <space><tab> <CMD>CocCommand explorer<CR>
nno <space><s-tab> <CMD>CocCommand explorer<CR>
nno X <CMD>bd<CR>
nno ,<tab> <CMD>CocList commands<CR>
nno <space><bs> <cmd>cd ..<CR>
nno <space>/ <cmd>Rg<CR>
nno <space>' <cmd>Ag<CR>
nno <space>? <cmd>Rg %:p:h<CR>
nno <space>" <cmd>Ag %:p:h<CR>
nno <space>- <CMD>split<CR>
nno <space>_ <CMD>vsplit<CR>
nno <space>= <C-w>v
nno <space>+ <C-w>s
" nno <space>| <CMD>vsplit<CR>
nno <space>. <CMD>so %<CR>
nno <space>, <CMD>so %<CR>
nm <esc> <cmd>noh<CR>
nno <space><esc> <ESC><c-u>:call chdir(fnamemodify(finddir('.git', expand('%:p:h') . ';'), ':h'))<CR>
nno <space>so <cmd>so ~/.vimrc<CR>
nm <c-h> <c-w>h
nm <c-j> <c-w>j
nm <c-k> <c-w>k
nm <c-l> <c-w>l
im <c-a> <home>
im <c-b> <left>
im <c-e> <end>
im <c-f> <right>
cm <c-a> <home>
cm <c-b> <left>
cm <c-e> <end>
cm <c-f> <right>
nno <space>f. <CMD>Files %:p:h<CR>
nno <space>fo <cmd>History<CR>
nno <space>fr <cmd>History<CR>
nno <space>ff <cmd>Files<CR>
nno <space>fc <cmd>Commands<CR>
nno <space>fm <cmd>Maps<CR>
nno <space>fb <cmd>Buffers<CR>
nno <space>fa <cmd>Ag<CR>
nno <space>fl <cmd>Lines<CR>
nno <space>ft <cmd>Tags<CR>
nno <space>fg <cmd>Rg<CR>
nno <space>fh <cmd>Helptags<CR>
nno <space>vr <CMD>e ~/.vimrc<CR>
nno <space>vi <CMD>e ~/.config/vim/init.vim<CR>
nno <space>vm <CMD>e ~/.config/vim/map.vim<CR>
nno <space>vk <CMD>e ~/.config/vim/map.vim<CR>
nno <space>vs <CMD>e ~/.config/vim/setup.vim<CR>
nno <space>vp <CMD>e ~/.config/vim/plugin.vim<CR>
nno <space>vo <CMD>e ~/.config/vim/opt.vim<CR>
nno <space>va <CMD>e ~/.config/vim/autocmd.vim<CR>
nno <space>vA <CMD>e ~/.config/vim/abbrev.vim<CR>
nno <space>vc <CMD>e ~/.config/vim/coc.vim<CR>
nno <space>vu <CMD>e ~/.config/vim/ui.vim<CR>
nno H <cmd>bp<CR>
nno L <cmd>bn<CR>
nno <space>bd <CMD>bd<CR>
nno <space>w <CMD>w<CR>
nno <space>q <CMD>q<CR>
nno <space>Q <CMD>qa!<CR>
nno <space>x <CMD>x<CR>


nno ,. <CMD>so %<CR>

" nno <space>/ <CMD>Rg <C-r><C-w><CR>

imap <silent><script><expr> <C-e> copilot#Accept("\<CR>")
imap <silent><script><expr> <tab> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-l> copilot#Next()
imap <silent><script><expr> <C-h> copilot#Previous()
imap <silent><script><expr> <C-y> copilot#Dismiss()
let g:copilot_no_tab_map = v:false
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-u>WhichKeyVisual '<Space>'<CR>
nnoremap <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <localleader> :<c-u>WhichKeyVisual  ','<CR>
