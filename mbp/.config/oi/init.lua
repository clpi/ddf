-- local lazy = require("lazy")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup({
	spec = {
		"Shatur/neovim-ayu",
		'marko-cerovac/material.nvim',
		{ import = "plug" },
	},
	install = { colorscheme = { "habamax" } },
	checker = { enabled = true },
})


require("maps").setup()

-- require("opts").setup()

local o, g = vim.opt, vim.g
  o.pumblend = 11
	o.confirm = false
	o.warn = false
  o.winblend = 12
  o.smoothscroll = true
	o.signcolumn = 'yes'
  o.splitbelow = true
	o.clipboard = 'unnamedplus'
	o.swapfile = false
	o.undofile = true
	o.undodir = vim.fn.stdpath('cache') .. '/undo'
	o.backup = false
	o.writebackup = false
	o.backupskip = { '/tmp/*', '/private/tmp/*' }
	o.completeopt = 'menuone,noselect'
	o.shortmess:append('c')
	o.iskeyword:append('-')
	o.isfname:append('@-@')
	o.isfname:append(':')
  o.softtabstop = 0
  o.tabstop = 2
  o.shiftwidth = 2
  o.number = true
  o.relativenumber = true
  o.cursorline = true
	o.mouse = 'a'
  o.wrap = true
  o.scrolloff = 8
  o.sidescrolloff = 8
  o.showmode = false
  o.splitright = true
  o.pumheight = 0
  o.wildignorecase = true
  o.infercase = true
  o.incsearch = true
  o.hlsearch = true
  o.guifont = 'ZedMono Nerd Font:h11'
	o.guifontwide = 'Iosevka Nerd Font:h11'
	g.colorscheme = "sorbet"
	o.showtabline = 2
	o.laststatus = 3
	o.autochdir = true
	-- vim.cmd[[colorscheme sorbet]]

	vim.cmd[[
nno <space>e <CMD>Neotree toggle<CR>

"local icons = {
"  [vim.diagnostic.severity.ERROR] = "",
"  [vim.diagnostic.severity.WARN] = "",
"  [vim.diagnostic.severity.INFO] = "",
"  [vim.diagnostic.severity.HINT] = "",
"}

colorscheme ayu-mirage
set autochdir
set number
set relativenumber
	]]
	require("telescope").load_extension("aerial")
	require("telescope").load_extension("codecompanion")
require("telescope").load_extension("zoxide")
