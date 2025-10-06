lua << EOF

local g = vim.g.
g.gui_transparency_default = 0.96
if g.neovide then
  require("base/gui/neovide")
  require("keys/gui/neovide")
end
if g.GuiLoaded then
  require("base/gui/nvim-qt")
  require("keys/gui/nvim-qt")
end

EOF
