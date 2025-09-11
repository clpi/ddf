-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o, g = vim.opt, vim.g

g.lazyvim_blink_main = true

o.pumheight = 0
o.confirm = false
o.warn = false
o.laststatus = 3
o.guifontwide = "ZedMono Nerd Font:h12"
o.guifont = "ZedMono Nerd Font:h12"
o.pumblend = 10
o.winblend = 10
o.smoothscroll = true
o.swapfile = false
o.autochdir = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 0
o.smarttab = true
o.infercase = true
o.smartcase = true
o.expandtab = true
if g.neovide then
  o.linespace = 0
  g.neovide_opacity = 0.9
  g.neovide_normal_opacity = 0.95
  g.transparency = 0.95
  g.neovide_window_blurred = true
  g.neovide_show_border = true
  g.experimental_layer_grouping = true
  g.neovide_refresh_rate = 100
  g.neovide_refresh_rate_idle = 5
  g.neovide_confirm_quit = false
end
vim.g.icloud = "/Users/clp/Library/Mobile Documents/com~apple~CloudDocs"
vim.g.wiki_templates = "/wiki/templates"
vim.g.homed = "/Users/clp/d"
vim.g.homea = "/Users/clp/a"
vim.g.homeb = "/Users/clp/b"
vim.g.homec = "/Users/clp/c"
vim.g.vimwiki_list = {
  {
    template_path = "/Users/clp/wiki/templates",
    syntax = "markdown",
    ext = ".md",
    path = "/Users/clp/wiki",
  },
  {
    template_path = "/Users/clp/d/wiki/templates",
    syntax = "markdown",
    ext = ".md",
    path = "/Users/clp/d/wiki",
  },
  {
    template_path = "/Users/clp/c/wiki/templates",
    syntax = "markdown",
    ext = ".md",
    path = "/Users/clp/c/wiki",
  },
  {
    template_path = vim.g.icloud .. "/wiki/templates",
    syntax = "markdown",
    ext = ".md",
    path = vim.g.icloud .. "/wiki",
  },
}
