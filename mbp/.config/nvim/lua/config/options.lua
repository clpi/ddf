-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o = vim.o
local g = vim.g

o.guifont = "ZedMono Nerd Font:h10"
o.guifontwide = "ZedMono Nerd Font:h11"
o.linespace = 0
g.transparency = 0.95
o.smoothscroll = true
o.pumheight = 0
o.pumblend = 10
o.winblend = 12
o.smoothscroll = true
o.laststatus = 3
o.showtabline = 3

if g.neovide then
  g.neovide_padding_top = 0
  g.neovide_padding_bottom = 0
  g.neovide_padding_right = 0
  g.neovide_padding_left = 0
  g.neovide_opacity = 0.0
  g.neovide_window_blurred = true
  -- g.neovide_theme = "auto"
  g.neovide_floating_blurred_amount_x = 5.0
  g.neovide_floating_blurred_amount_y = 5.0
  g.neovide_floating_shadow = true
  g.neovide_cursor_hack = true
  g.neovide_floating_corner_radius = 0.0
  g.neovide_input_macos_option_key_is_meta = "only_left"
  g.neovide_normal_opacity = 0.99
  g.neovide_show_border = true
  g.neovide_cursor_vfx_mode = "railgun" -- pixiedust, torpedo, sonicboom, wireframe, ripple
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_smooth_blink = true
  g.neovide_cursor_animate_command_line = true
  g.experimental_layer_grouping = true
  g.neovide_position_animation_length = 0.15
  -- g.neovide_refresh_rate = 120
end

local abbrev = require("config.abbrev")
