vim.lsp.config("lua_ls", require("lsp.lua"))
vim.lsp.config("bashls", require("lsp.bashls"))
vim.lsp.config("groovyls", require("lsp.groovyls"))
vim.lsp.config("yamlls", require("lsp.yamlls"))
vim.lsp.config("helm_ls", require("lsp.helm_ls"))
vim.lsp.config("nil", require("lsp.nil"))
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "elvish",
-- 	callback = function()
-- 		vim.lsp.start(require("lsp.elvish"))
-- 	end,
-- })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	callback = function()
		vim.lsp.start(require("lsp.nil"))
	end,
})
vim.lsp.config("gopls", require("lsp.gopls"))
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
})

vim.lsp.config("elvish_ls", require("lsp.elvish"))
vim.lsp.config("nu_ls", require("lsp.nu"))
