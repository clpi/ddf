require("lsp")
local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

for name, icon in pairs(symbols) do
	local hl = "DiagnosticSign" .. name
	vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

vim.diagnostic.config({
	virtual_text = true,
})

vim.lsp.config("groovy_lsp", {
	cmd = { "groovy-language-server" },
	filetypes = { "groovy" },
	-- root_dir = vim.fs.dirname(vim.fs.find({ ".git", "settings.gradle", "settings.gradle.kts" }, { upward = true })[1]),
	settings = {
		groovy = {
			linting = {
				enabled = true,
			},
			compiler = {
				independentOfJavaVersion = true,
			},
		},
	},
})
