local o = vim.opt
local g = vim.g
local env = vim.env

o.pumheight = 0
o.numberwidth = 2
o.signcolumn = "yes:1"
o.termguicolors = true
o.hlsearch = true
o.ignorecase = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.swapfile = false
o.backup = false
o.undofile = true
o.cursorline = true
o.clipboard = "unnamedplus"
o.smoothscroll = true
o.smartcase = true
g.mapleader = " "

g.maplocalleader = ","

o.autoread = true
o.pumblend = 10
o.winblend = 10
o.autowrite = true
o.inccommand = "nosplit"
o.completeopt = { "menuone", "popup", "noinsert" }
o.winborder = nil
o.guifont = "ZedMono Nerd Font:h11"
o.guifontwide = "ZedMono Nerd Font:h11"

o.splitbelow = true
o.splitright = true
o.autochdir = false
o.incsearch = true

o.number = true
o.expandtab = true
o.softtabstop = 2
o.tabstop = 2
o.shiftwidth = 2
o.relativenumber = true
o.laststatus = 3
o.showtabline = 3
o.wildignorecase = false
o.breakindent = true
o.smartindent = true
o.wrap = true
o.linebreak = true

o.ignorecase = true
o.infercase = true
o.timeoutlen = 300
o.inccommand = "split"
o.signcolumn = "yes"
o.smoothscroll = true

g.mapleader = " "
g.maplocalleader = ","
env.PATH = env.HOME .. "/.local/share/mise/shims:" .. env.PATH
