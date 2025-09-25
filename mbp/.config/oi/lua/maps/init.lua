local K = {}

K.setup = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","
	vim.cmd([[
	nno <silent> <space>vc <CMD>Telescope find_files cwd=/Users/clp/.config/oi<CR>
	cabbr tl Telescope
	cabbr ae Aeria
	cabbr cc CopilotChat
	cabbr cm CodeCompanion
	cabbr av Avante
	cabbr tt ToggleTerm
	cabbr nt Neotree
	cabbr tr Trouble
	cabbr nc Neoconf
	cabbr ma Mason
	cabbr la Lazy
	cabbr cf Conform
	cabbr gf GrugFar
	cabbr cy Cody
	set wildmenu
	nno <silent> <space>vi <CMD>e $HOME/.config/oi/init.lua<CR>
	nno <silent> <space>vm <CMD>e $HOME/.config/oi/lua/maps/init.lua<CR>
	nno <silent> <space>vp <CMD>e $HOME/.config/oi/lua/plug/init.lua<CR>
		nnoremap <silent> <C-h> <C-w>h
		nnoremap <silent> <C-j> <C-w>j
		nnoremap <silent> <C-k> <C-w>k
		nnoremap <silent> <C-l> <C-w>l
		nnoremap <silent> <C-Up> <C-w>k
		nnoremap <silent> <C-Down> <C-w>j
		nnoremap <silent> <C-Left> <C-w>h
		nnoremap <silent> <C-Right> <C-w>l
		nnoremap <silent> <C-S-Up> <C-w>5k
		nnoremap <silent> <C-S-Down> <C-w>5j
		nnoremap <silent> <C-S-Left> <C-w>5h
		nnoremap <silent> <C-S-Right> <C-w>5l
		nnoremap <silent> <space><C-S-Tab> <C-w>w
		nnoremap <silent> <space><C-Tab> <C-w>w

		nnoremap <S-h> <CMD>bprevious<CR>
		nnoremap <S-l> <CMD>bnext<CR>
		nnoremap <S-j> <CMD>cnext<CR>
		nnoremap <S-k> <CMD>cprevious<CR>

		cnoremap <C-a> <HOME>
		cnoremap <C-e> <END>
		cnoremap <C-f> <RIGHT>
		cnoremap <C-b> <LEFT>
		cnoremap <C-d> <DEL>
		cnoremap <C-h> <BS>
		cnoremap <C-u> <C-BS>
		cnoremap <C-w> <C-W>
		cnoremap <C-k> <C-Y>
		cnoremap <C-t> <C-R>=expand("%:p:h") . "/"<CR><C-f>

		imap jk <ESC>

		imap kj <ESC>

		vnoremap <silent> < <gv
		vnoremap <silent> > <gv
		nmap 0 ^

		nno <space>fo <CMD>Telescope oldfiles<CR>
		nno <space>ff <CMD>Telescope find_files<CR>
		nno <space>fd <CMD>Telescope fd<CR>
		nno <space>f. <CMD>Telescope find_files cwd=%:p:h<CR>
		nno <space>fb <CMD>Telescope buffers<CR>
		nno <space>fh <CMD>Telescope help_tags<CR>
		nno <space>fr <CMD>Telescope resume<CR>
		nno <space>fs <CMD>Telescope live_grep<CR>
		nno <space>fc <CMD>Telescope commands<CR>
		nno <space>f; <CMD>Telescope command_history<CR>
		nno <space>f/ <CMD>Telescope search_history<CR>


	]])
  vim.keymap.set({ "n" }, ";", ":", { remap = true, nowait = true, desc = "semicolon" })
  vim.keymap.set({ "n" }, "<tab>", "<CMD>lua vim.diagnostic.goto_next()<CR>", { remap = true, nowait = true, desc = "next diagnostic" })
  vim.keymap.set({ "n" }, "<s-tab>", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { remap = true, nowait = true, desc = "next diagnostic" })
  vim.keymap.set(
    { "n" },
    "`",
    "<CMD>Telescope find_files cwd=%:p:h<CR>",
    { remap = true, nowait = true, desc = "semicolon" }
  )
end

return K
