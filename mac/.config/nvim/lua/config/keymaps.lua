-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local km = LazyVim.safe_keymap_set
local function map(mode, key, cmd, desc)
  LazyVim.safe_keymap_set(mode, key, "<CMD>" .. cmd .. "<CR>", { desc = desc or cmd })
end

local opts = function(cmd, desc)
  if type(desc) == "table" then
    return desc
  elseif type(desc) == "string" then
    return { desc = desc or cmd, noremap = true, silent = true, nowait = true }
  elseif type(desc) == "nil" then
    return { desc = cmd, noremap = true, silent = true, nowait = true }
  else
    return desc
  end
end
local k = {
  n = function(key, cmd, desc)
    km("n", key, "<CMD>" .. cmd .. "<CR>", opts(cmd, desc))
  end,
  x = function(key, cmd, desc)
    km("x", key, "<CMD>" .. cmd .. "<CR>", opts(cmd, desc))
  end,
  i = function(key, cmd, desc)
    km("i", key, "<CMD>" .. cmd .. "<CR>", opts(cmd, desc))
  end,
  c = function(key, cmd, desc)
    km("c", key, "<CMD>" .. cmd .. "<CR>", opts(cmd, desc))
  end,
  v = function(key, cmd, desc)
    km("v", key, "<CMD>" .. cmd .. "<CR>", opts(cmd, desc))
  end,
}

k.n(",cd", "cd %:p:h")
k.n("<TAB>", "lua vim.diagnostic.goto_next()", { desc = "Goto next diagnostic" })
k.n("<S-TAB>", "lua vim.diagnostic.goto_prev()", { desc = "Goto next diagnostic" })
k.n("<space>vc", "Telescope find_files cwd=~/.config/nvim", { desc = "Find config files" })
km("c", "<C-f>", "<Right>", { desc = "Move cursor right in command mode" })
km("c", "<C-b>", "<Left>", { desc = "Move cursor left in command mode" })
km("c", "<C-a>", "<Home>", { desc = "Move cursor to start in command mode" })
km("c", "<C-e>", "<End>", { desc = "Move cursor to end in command mode" })
km("i", "<C-f>", "<Right>", { desc = "Move cursor right in command mode" })
km("i", "<C-b>", "<Left>", { desc = "Move cursor left in command mode" })
km("i", "<C-a>", "<Home>", { desc = "Move cursor to start in command mode" })
km("i", "<C-e>", "<End>", { desc = "Move cursor to end in command mode" })

km("x", "<", "<gv", { desc = "Shift left and reselect", noremap = true, nowait = true })
km("x", ">", ">gv", { desc = "Shift right and reselect", noremap = true, nowait = true })
k.n("<space>cc", "CopilotChatToggle", { desc = "Copilot chat" })
k.n("<space>fs", "Telescope find_files cwd=~/.config/fish", { desc = "Find fish files" })
k.n("<space>fz", "Telescope find_files cwd=~/.config/zsh", { desc = "Find zsh files" })
k.n("<space>fn", "Telescope find_files cwd=~/.config/nvim", { desc = "Find nvim files" })
k.n("<space>fl", "Telescope find_files cwd=~/.config/lvim", { desc = "Find lvim files" })
k.n("<space>fx", "Telescope find_files cwd=~/.config/hx", { desc = "Find hx files" })
k.n("<space>cd", "cd %:p:h", { desc = "Change directory to current file's directory" })
k.n("<space>so", "so %", { desc = "Source file" })
km("n", "0", "^", { desc = "Go to first non-blank character of the line" })
km("n", ";", ":", { silent = false, desc = "Command", noremap = true })
km("n", ":", ";", { silent = false, desc = "Repeat", noremap = true })
km("n", "<ESC>", ":cclose<BAR>nohlsearch<CR>", { silent = true, desc = "Close quickfix and no highlight" })
km("n", "Y", "y$", { desc = "Yank to end of line" })
km("n", "!", ":!", { silent = false, desc = "Exec" })
km("n", ",r", ":%s///g<left><Left><Left>", { desc = "Replace in file", silent = false, noremap = true })
km("n", ",R", ":%s///gi<left><left><Left><Left>", { desc = "Replace in file", silent = false, noremap = true })
km(
  "n",
  ",,r",
  ":%s/<<C-r><C-w>>//gc<Left><Left><Left>",
  { desc = "Replace word in file", silent = false, noremap = true }
)
km(
  "v",
  "<C-r>",
  "hy:%s/<C-r>h//gc<Left><Left><Left>",
  { desc = "Replace selection in file", silent = false, noremap = true }
)
km(
  "v",
  "<space><C-r>",
  "hy:%s/<C-r>h/<C-r>h/g<Left><Left>",
  { desc = "Replace selection in file", silent = false, noremap = true }
)
