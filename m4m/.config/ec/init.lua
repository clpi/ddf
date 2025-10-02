-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/nvim-mini/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })
-- vim.fn.sign_define(
-- 	"DiagnosticSignError",
-- 	{ text = "", hl = "DiagnosticSignError", texthl = "DiagnosticSignError", culhl = "DiagnosticSignErrorLine" }
-- )
-- vim.fn.sign_define(
-- 	"DiagnosticSignWarn",
-- 	{ text = "", hl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn", culhl = "DiagnosticSignWarnLine" }
-- )
-- vim.fn.sign_define(
-- 	"DiagnosticSignInfo",
-- 	{ text = "", hl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo", culhl = "DiagnosticSignInfoLine" }
-- )
-- vim.fn.sign_define(
-- 	"DiagnosticSignHint",
-- 	{ text = "", hl = "DiagnosticSignHint", texthl = "DiagnosticSignHint", culhl = "DiagnosticSignHintLine" }
-- )
-- fix spelling: just an easier finger roll on 40% keyboard



require("plugin")
require("opts")
require("lsp")
require("keymap")
vim.cmd[[
nno ; :
]]
vim.cmd([[ colorscheme miniautumn ]])

vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
