return {
	{
		"rebelot/kanagawa.nvim",
		config = function(...)
			require("kanagawa").setup({
				compile = true,
				keywordStyle = { italic = true },
				commentStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = { italic = true },
				dimInactive = true,
				theme = "wave",
				overrides = function(c)
					return {}
				end,
				background = {
					dark = "wave",
					light = "lotus",
				},
			})
			require("kanagawa").load("wave")
		end,
	},
	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		enabled = false,
		priority = 1000,
		opts = {
			gutter = true,
			dim_inactive = true,
			cache = true,
			integrations = {
				wezterm = {
					enabled = true,
					path = (os.getenv("HOME") or "~") .. "/.config/wezterm/colors/kanagawa-paper.toml",
				},
			},
			styles = {
				functions = { italic = true },
				keyword = { italic = false, bold = false },
				statement = { italic = false, bold = false },
				type = { italic = false },
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function(...)
			-- load the colorscheme here
			-- vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
