local function map(mode, key, cmd, desc)
	vim.keymap.set(mode, key, "<CMD>" .. cmd .. "<CR>", { desc = desc or cmd })
end
local km = vim.keymap.set
km("n", "<TAB>", "<CMD>lua vim.diagnostic.goto_next()<CR>", { desc = "Goto next diagnostic" })
km("n", "<S-TAB>", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { desc = "Goto next diagnostic" })
vim.cmd([[
  nno ; :
  nno ,l <CMD>e $CFG/lvim/config.lua<CR>
  nno ,n <CMD>e $CFG/nvim/init.lua<CR>
  nno ,v <CMD>e $CFG/vim/vimrc<CR>
  nno H <CMD>bp<CR>
  nno L <CMD>bn<CR>
]])
vim.g.icloud = "/Users/clp/Library/Mobile Documents/com~apple~CloudDocs"
vim.g.wiki_templates = "/wiki/templates"
vim.g.homed = "/Users/clp/d"
vim.g.homea = "/Users/clp/a"
vim.g.homeb = "/Users/clp/b"
vim.g.homec = "/Users/clp/c"
lvim.plugins = {

	{ "Mythos-404/xmake.nvim", opts = {} },
	{ "S1M0N38/love2d.nvim", opts = {} },
	{
		"vimwiki/vimwiki",
		branch = "dev",
		lazy = false,
		keys = {
			{
				"<leader>wi",
				function()
					vim.cmd("VimwikiIndex")
				end,
				desc = "Open Vimwiki Index",
			},
			{
				"<leader>w<tab>",
				function()
					vim.cmd("VimwikiTabIndex")
				end,
				desc = "Open Vimwiki Tab Index",
			},
			{
				"<leader>wf",
				function()
					vim.cmd("VimwikiSearch")
				end,
				desc = "Search Vimwiki",
			},
			{
				"<leader>wl",
				function()
					vim.cmd("VimwikiList")
				end,
				desc = "List Vimwiki",
			},
			{
				"<leader>wn",
				function()
					vim.cmd("VimwikiNew")
				end,
				desc = "New Vimwiki Page",
			},
			{
				"<leader>wd",
				function()
					vim.cmd("VimwikiDiaryIndex")
				end,
				desc = "Open Vimwiki Diary Index",
			},
			{
				"<leader>wD",
				function()
					vim.cmd("VimwikiDiaryGenerateLinks")
				end,
				desc = "Generate Vimwiki Diary Links",
			},
			{
				"<leader>wN",
				function()
					vim.cmd("VimwikiToggleList")
				end,
				desc = "Toggle Vimwiki List",
			},
			{
				"<leader>wh",
				function()
					vim.cmd("VimwikiToggleHeader")
				end,
				desc = "Toggle Vimwiki Header",
			},
			{
				"<leader>w<space>",
				function()
					vim.cmd("VimwikiMakeDiaryNote")
				end,
				desc = "Make diary note",
			},
			{
				"<leader>wt",
				function()
					vim.cmd("VimwikiMakeTomorrowDiaryNote")
				end,
				desc = "Make tomorrow diary note",
			},
			{
				"<leader>wy",
				function()
					vim.cmd("VimwikiMakeYesterdayDiaryNote")
				end,
				desc = "Make yesterday diary note",
			},
			{
				",w,",
				function()
					vim.cmd("VimwikiMakeDiaryNote")
				end,
				desc = "Make diary note",
			},
			{
				",wt",
				function()
					vim.cmd("VimwikiMakeTomorrowDiaryNote")
				end,
				desc = "Make tomorrow diary note",
			},
			{
				",wy",
				function()
					vim.cmd("VimwikiMakeYesterdayDiaryNote")
				end,
				desc = "Make yesterday diary note",
			},
		},
		config = function()
			vim.g.vimwiki_list = {
				{
					template_path = "/Users/clp/wiki/templates",
					syntax = "markdown",
					ext = ".md",
					path = "/Users/clp/wiki",
				},
				{
					template_path = "/Users/clp/d/wiki/templates",
					syntax = "markdown",
					ext = ".md",
					path = "/Users/clp/d/wiki",
				},
				{
					template_path = "/Users/clp/c/wiki/templates",
					syntax = "markdown",
					ext = ".md",
					path = "/Users/clp/c/wiki",
				},
				{
					template_path = vim.g.icloud .. "/wiki/templates",
					syntax = "markdown",
					ext = ".md",
					path = vim.g.icloud .. "/wiki",
				},
			}
			vim.g.vimwiki_global_ext = 0
		end,
	},
	{ "Shatur/neovim-ayu" },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
			"folke/snacks.nvim", -- optional
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
		end,
	},
	{
		"alaviss/nim.nvim",
	},
	{ "echasnovski/mini.animate", opts = {}, version = false },
	{ "echasnovski/mini.indentscope", opts = {}, version = false },
	{
		"akinsho/toggleterm.nvim",
		opts = {
			open_mapping = [[<c-o>]],
			direction = "horizontal",
			-- size = 25,
		},
	},
	{
		"folke/snacks.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		-- opts will be merged with the parent spec
		opts = { use_diagnostic_signs = true },
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
				},
			},
		},
	},
	{ "tpope/vim-surround" },
	{
		"zbirenbaum/copilot.lua",
		opts = {
			panel = {
				enabled = true,
			},
			file_types = {
				markdown = true,
				yaml = true,
			},
			suggestion = {
				enabled = true,
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{ "RRethy/nvim-treesitter-endwise" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"olimorris/codecompanion.nvim",
		opts = {
			extensions = {
				mcphub = {
					callback = "mcphub.extensions.codecompanion",
					opts = {
						make_vars = true,
						make_slash_commands = true,
						show_result_in_chat = true,
					},
				},
			},
		},
		dependencies = {
			-- {
			"ravitemer/mcphub.nvim",
			-- dependencies = {
			-- "nvim-lua/plenary.nvim",
			-- },
			-- build = "npm i -g mcp-hub@latest",
			-- config = function()
			-- require("mcphub").setup()
			-- end,
			-- },
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "windwp/nvim-autopairs", opts = {} },
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = function()
			-- conditionally use the correct build system for the current OS
			if vim.fn.has("win32") == 1 then
				return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			else
				return "make"
			end
		end,
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			-- add any opts here
			-- for example
			provider = "claude",
			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-20250514",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante", "CodeCompanion" },
				},
				ft = { "markdown", "Avante", "CodeCompanion" },
			},
		},
	},
	{
		"saghen/blink.cmp",
		enabled = true,
		-- optional: provides snippets for the snippet source
		dependencies = { "rafamadriz/friendly-snippets" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default" },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				menu = {
					draw = {
						padding = { 0, 1 },
						components = {
							kind_icon = {
								text = function(c)
									return " " .. c.kind_icon .. c.icon_gap .. " "
								end,
							},
						},
					},
				},
				documentation = {
					auto_show = true,
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}

lvim.builtin.cmp.enabled = false
lvim.colorscheme = "tokyonight-storm"
