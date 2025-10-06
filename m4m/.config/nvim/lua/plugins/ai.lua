return {
	{
		"Davidyz/VectorCode",
		opts = {},
	},
	{
		"folke/sidekick.nvim",
		keys = {
			{
				"<tab>",
				function()
					-- if there is a next edit, jump to it, otherwise apply it if any
					if not require("sidekick").nes_jump_or_apply() then
						return "<Tab>" -- fallback to normal tab
					end
				end,
				expr = true,
				desc = "Goto/Apply Next Edit Suggestion",
			},
			{
				"<leader>aa",
				function()
					require("sidekick.cli").toggle()
				end,
				desc = "Sidekick Toggle CLI",
			},
			{
				"<leader>as",
				function()
					require("sidekick.cli").select()
				end,
				-- Or to select only installed tools:
				-- require("sidekick.cli").select({ filter = { installed = true } })
				desc = "Select CLI",
			},
			{
				"<leader>at",
				function()
					require("sidekick.cli").send({ msg = "{this}" })
				end,
				mode = { "x", "n" },
				desc = "Send This",
			},
			{
				"<leader>av",
				function()
					require("sidekick.cli").send({ msg = "{selection}" })
				end,
				mode = { "x" },
				desc = "Send Visual Selection",
			},
			{
				"<leader>ap",
				function()
					require("sidekick.cli").prompt()
				end,
				mode = { "n", "x" },
				desc = "Sidekick Select Prompt",
			},
			{
				"<c-.>",
				function()
					require("sidekick.cli").focus()
				end,
				mode = { "n", "x", "i", "t" },
				desc = "Sidekick Switch Focus",
			},
			-- Example of a keybinding to open Claude directly
			{
				"<leader>ac",
				function()
					require("sidekick.cli").toggle({ name = "claude", focus = true })
				end,
				desc = "Sidekick Toggle Claude",
			},
		},
		opts = {
			cli = {
				mux = {
					backend = "zellij",
					enabled = true,
				},
			},
		},
	},
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
