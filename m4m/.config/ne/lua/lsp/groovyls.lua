return {
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
}
