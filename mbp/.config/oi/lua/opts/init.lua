local o, g, w, b, bo, wo = vim.opt, vim.g, vim.w, vim.b, vim.bo, vim.wo
local O = {}

O.opts = {
  smoothscroll = true
}

O.setup = function()
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
	vim.cmd[[colorscheme sorbet]]
end

return O

