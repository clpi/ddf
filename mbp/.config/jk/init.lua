require("setup")
require("deps")
require("deps.config")
require("deps.config.mini")
require("deps.config.ai")
require("deps.config.lsp")
require("deps.config.lsp.ai")
require("deps.config.lsp.lua")
require("deps.config.treesitter")
require("deps.config.telescope")
require("opts")
require("keymap")
-- removes trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})
-- Restore cursor to file position in previous editing session
-- vim.api.nvim_create_autocmd("BufReadPost", {
-- 	callback = function(args)
-- 		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
-- 		local line_count = vim.api.nvim_buf_line_count(args.buf)
-- 		if mark[1] > 0 and mark[1] <= line_count then
-- 			vim.cmd('normal! g`"zz')
-- 		end
-- 	end,
-- })
vim.opt.list = false
vim.opt.winblend = 10
vim.opt.laststatus = 3
vim.opt.autoindent = true
vim.opt.pumblend = 14
vim.opt.gdefault = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autochdir = true
			require("tiny-inline-diagnostic").setup({})
			vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError", icon = "✘" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", icon = "" })
-- require("ayu").setup({})
-- vim.fn.sign_define("DiagnosticSignError", {text = "", hl = "DiagnosticSignError", texthl = "DiagnosticSignError", culhl = "DiagnosticSignErrorLine"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", hl = "DiagnosticSignWarn", texthl = "DiagnosticSignWarn", culhl = "DiagnosticSignWarnLine"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", hl = "DiagnosticSignInfo", texthl = "DiagnosticSignInfo", culhl = "DiagnosticSignInfoLine"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", hl = "DiagnosticSignHint", texthl = "DiagnosticSignHint", culhl = "DiagnosticSignHintLine"})
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", icon = "" })
vim.cmd.colorscheme("everforest")

vim.cmd[[
nno ; :
nno <space>vc <CMD>Telescope find_files cwd=~/.config/jk<CR>
]]
