return {
	{
		"greggh/claude-code.nvim",
		enabled = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for git operations
		},
		opts = {},
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {
			memory = {
				default = {
					description = "Default memory settings",
					files = {
						"AGENTS.md",
						"~/hg/.infrastructure.md",
					},
				},
				opts = {
					chat = {
						default_memory = "default",
					},
				},
			},
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_results_in_chat = true,
					},
				},
			},
			strategies = {
				inline = {
					adapter = "githubmodels",
				},
				chat = {
					adapter = "githubmodels",
				},
			},
		},
		-- cmd = { "CodeCompanion" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ravitemer/mcphub.nvim",

			{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

			{
				"saghen/blink.cmp",
				lazy = false,
				version = "*",
				opts = {
					keymap = {
						preset = "enter",
						-- ["<S-Tab>"] = { "select_prev", "fallback" },
						-- ["<Tab>"] = { "select_next", "fallback" },
					},
					cmdline = { sources = { "cmdline" } },
					sources = {
						default = { "lsp", "path", "buffer", "codecompanion" },
					},
				},
			},
		},
	},
	-- Amp Plugin
	{
		"sourcegraph/amp.nvim",
		branch = "main",
		enabled = true,
		lazy = false,
		opts = { auto_start = true, log_level = "info" },
	},

	{

		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false,
		opts = {
			instructions_file = "AGENTS.md",
			provider = "copilot",
			providers = {
				z = {
					endpoint = "https://api.z.ai/api/anthropic",
					model = "glm4.6",
					timeout = 30000,
				},
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-20250514",
					timeout = 30000,
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-mini/mini.pick",
			"nvim-telescope/telescope.nvim",
			"stevearc/dressing.nvim",
			"folke/snacks.nvim",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						use_absolute_path = false,
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante", "copilot-chat", "codecompanion" },
				},
				ft = { "markdown", "Avante", "copilot-chat", "codecompanion" },
			},
			"MunifTanjim/nui.nvim",
		},
	},
}
