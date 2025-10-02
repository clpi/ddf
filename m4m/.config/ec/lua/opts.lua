
local o = vim.opt
local g = vim.g
local k = vim.keymap.set
vim.env.PATH = vim.env.HOME .. '/.local/share/mise/shims:' .. vim.env.PATH
vim.api.nvim_set_hl(0, 'PmenuMatch', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'PmenuMatchSel', { link = 'PmenuSel' })
g.mapleader = " "
o.pumheight = 0
o.background = "dark"
g.maplocalleader = ","
o.icm = "split"
o.showmode = false
o.number = true
o.relativenumber = true
o.laststatus = 3
o.signcolumn = "yes"
o.pumblend = 10
o.winblend = 10
o.incsearch = true
o.hlsearch = true
o.showtabline = 3
o.cursorline = true
o.expandtab = true
o.softtabstop = 2
o.tabstop = 2
o.shiftwidth = 2

