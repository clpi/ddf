-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local K = {}

K.o = { noremap = true, silent = true, nowait = true }

---@param m string|string[]|nil The mode(s) to set the keymap for
---@param k string The key to map
---@param v string|function The action to perform
---@param o table|nil Additional oions for the keymap
--- Maps a key in the given mode(s)
function K.m(m, k, v, o)
  vim.keymap.set(m or "n", k, v, o or K.o)
end

---@param k string The key to map
---@param v string|function The action to perform
---@param o table|nil Additional oions for the keymap
--- Maps a key in normal mode
function K.n(k, v, o)
  K.m("n", k, v, o)
end

---@param k string The key to map
---@param v string|function The action to perform
---@param o table|nil Additional oions for the keymap
--- Maps a key in insert mode
function K.i(k, v, o)
  K.m("i", k, v, o)
end

function K.leader()
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","
end

function K.cv(f, e)
  if require("copilot.suggestion").is_visible() and type(f) == "function" then
    print("copilot suggestion is visible")
    return f
  elseif type(e) == "function" then
    return e
  else
    return function() end
  end
end

function K.bv(f, e)
  if require("blink.cmp").is_visible() and type(f) == "function" then
    return f
  elseif type(e) == "function" then
    return e
  else
    return function() end
  end
end

function K.vim()
  if vim.g.vscode then
    return function() end
  else
    return require("config.keymaps")
  end
end
function K.init()
  K.n(";", ":")
  K.n("<space>fd", "<CMD>Telescope find_files cwd=/Users/clp/.config<CR>")
  K.n("<space>vc", "<CMD>Telescope find_files cwd=/Users/clp/.config/nvim<CR>")
  K.n("<space>Px", "<CMD>LazyExtras<CR>")
  K.n(",R", "<CMD>so /Users/clp/.config/nvim/init.lua<CR>")
  K.n(",L", "<CMD>so /Users/clp/.config/lvim/config.lua<CR>")
  K.n(",C", "<CMD>e /Users/clp/.config/nvim/init.lua<CR>")
  K.n("<tab>", "<CMD>lua vim.diagnostic.goto_next()<CR>")
  K.n("<s-tab>", "<CMD>lua vim.diagnostic.goto_prev()<CR>")
  K.n("<space><tab>", "<CMD>lua vim.diagnostic.get_next()<CR>")
  K.n("<space><s-tab>", "<CMD>lua vim.diagnostic.get_prev()<CR>")
  function K.copilot()
    K.n("<leader>cc", "<CMD>Copilot chat<CR>", { desc = "Copilot Chat" })
    K.n("<leader>cp", "<CMD>Copilot panel<CR>", { desc = "Copilot Panel" })
    K.n("<leader>cs", "<CMD>Copilot status<CR>", { desc = "Copilot Status" })
    K.n("<leader>ct", "<CMD>Copilot toggle<CR>", { desc = "Copilot Toggle" })
  end

  K.i("<tab>", "<CMD>lua require('copilot.suggestion').accept('<tab>')<CR>")
  K.i("<s-tab>", "<CMD>lua require('copilot.suggestion').accept()<CR>")
  K.i("<c-e>", "<CMD>lua require('copilot.suggestion').accept()<CR>")
  K.i("<c-y>", "<CMD>lua require('copilot.suggestion').dismiss()<CR>")
  K.i("<c-r>", "<CMD>lua require('copilot.suggestion').refresh()<CR>")
  K.i("<c-j>", "<CMD>lua require('copilot.suggestion').next()<CR>")
  K.i("<c-k>", "<CMD>lua require('copilot.suggestion').prev()<CR>")
  K.i("<c-d>", "<CMD>lua require('copilot.suggestion').next()<CR>")
  K.i("<c-u>", "<CMD>lua require('copilot.suggestion').prev()<CR>")
  K.i("<c-g>", "<CMD>lua require('copilot.suggestion').accept_word()<CR>")
  K.i("<c-l>", "<CMD>lua require('copilot.suggestion').accept_line()<CR>", { desc = "Accept Copilot suggestion line" })
  K.n("0", "^")
  K.m({ "i", "n" }, "<C-C><C-P>", require("CopilotChat").ask, { desc = "Copilot Chat Prompts" })
  K.m({ "i", "n" }, "<C-C><C-o>", require("CopilotChat").open, { desc = "Copilot Chat Open" })
  K.m({ "i", "n" }, "<C-C><C-C>", require("CopilotChat").toggle, { desc = "Copilot Chat Toggle" })
end

K.init()

return K
