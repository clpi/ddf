vim.pack.add({

	{ src = "https://github.com/pwntester/octo.nvim" },
	{ src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
	{ src = "https://github.com/sourcegraph/amp.nvim" },
	-- { src = "https://github.com/piersolenski/wtf.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/stevearc/aerial.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-mini/mini.bufremove" },
	{ src = "https://github.com/nvim-mini/mini.starter" },
	{ src = "https://github.com/isakbm/gitgraph.nvim" },
	{ src = "https://github.com/OXY2DEV/markview.nvim" },
	{ src = "https://github.com/ThePrimeagen/git-worktree.nvim" },
	--- lspconfig
	{ src = "https://github.com/MagicDuck/grug-far.nvim" },
	{ src = "https://github.com/greggh/claude-code.nvim" },
	-- { src = "https://github.com/nvim-neotest/neotest" },
	{ src = "https://github.com/lukas-reineke/headlines.nvim" },
	{ src = "https://github.com/xzbdmw/colorful-menu.nvim" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/onsails/lspkind.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },

	{ src = "https://github.com/ravitemer/mcphub.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/Bekaboo/dropbar.nvim" },
	{ src = "https://github.com/olimorris/codecompanion.nvim" },
	-- { src = "https://github.com/yetone/avante.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/ts-comments.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/NeogitOrg/neogit" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/romgrk/barbar.nvim" },
	{ src = "https://github.com/nanozuki/tabby.nvim" },
	{ src = "https://github.com/SmiteshP/nvim-navic" },
	{ src = "https://github.com/SmiteshP/nvim-navbuddy" },
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/stevearc/overseer.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/ray-x/go.nvim" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	{ src = "https://github.com/folke/neoconf.nvim" },
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/github/copilot.vim" },
	-- { src = "https://github.com/ThePrimeagen/refactoring.vim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	-- { src = "https://github.com/clpi/down.nvim" },
	{ src = "file:///Users/clp/clp/down.nvim", version = "*" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
})

require("treesitter-context").setup({})
require("nvim-treesitter.configs").setup({
	indent = { enable = true },
	highlight = {
		additional_vim_regex_highlighting = false,
		enable = true,
	},
})
require("overseer").setup({})
require("nvim-autopairs").setup({})
require("telescope").setup({})
require("lualine").setup(
	-- require("plugins.lualine.slant"))
)
require("conform").setup({})
require("neogit").setup({})
require("mini.icons").setup({})
require("mini.bufremove").setup({})
-- require("refactoring").setup({})

-- require("neotest").setup({})
require("grug-far").setup({})
require("blink.cmp").setup({
	signature = { enabled = true },

	fuzzy = {
		implementation = "lua",
		-- implementation = "prefer_rust_with_warning"
	},
	appearance = { nerd_font_variant = "normal", use_nvim_cmp_as_default = false },
	completion = {
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 0,
		},
	},
	cmdline = {
		keymap = {
			preset = "inherit",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = { default = { "lsp", "path", "snippets" } },
	keymap = {
		preset = "enter",
	},
})
require("mason").setup({
	install_root_dir = vim.fn.stdpath("data") .. "/../nvim/mason",
})
require("mason-lspconfig").setup({})
require("snacks").setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		},
	},
})
require("colorful-menu").setup({})
require("lazydev").setup({})
require("neoconf").setup({})
require("gitsigns").setup({ signcolumn = true })
require("gitgraph").setup({})
require("down").setup({
	workspace = {
		workspaces = {
			wiki = "~/wiki",
		},
		default = "wiki",
	},
})

vim.diagnostic.config({ virtual_text = true })
require("trouble").setup({})
require("which-key").setup({
	preset = "helix",
	delay = 0,
})
require("ts-comments").setup({})
require("telescope").setup({})
require("todo-comments").setup({})
-- require("noice").setup({})
require("markview").setup({})
require("mcphub").setup({})
require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "copilot",
		},
		inline = {
			adapter = "copilot",
		},
	},
	extensions = {
		mcphub = {
			callback = "mcphub.extensions.codecompanion",
			opts = {
				make_slash_commands = true,
				show_results_in_chat = true,
				make_vars = true,
			},
		},
	},
})
require("barbar").setup({
	icons = {
		preset = "slanted",
		-- buffer_index = true,
		-- buffer_number = true,
	},
})
-- require("tabby").setup({})
-- require("catppuccin").setup({
-- 	integrations = {
-- 		octo = true,
-- 		gitgraph = true,
-- 		headlines = true,
-- 		barbar = true,
-- 		lsp_trouble = true,
-- 		which_key = true,
-- 		overseer = true,
-- 		snacks = {
-- 			enabled = true,
-- 		},
-- 		copilot_vim = true,
-- 		markview = true,
-- 		-- grug_far = true,
-- 		fidget = true,
-- 		-- blink_cmp = {
-- 		--   style = "bordered",
-- 		-- },
-- 		dropbar = {
-- 			enabled = true,
-- 			color_mode = true,
-- 		},
-- 		diffview = true,
-- 		navic = {
-- 			enabled = true,
-- 		},
-- 	},
-- })
require("dropbar").setup({})
require("amp").setup({
	auto_start = false,
})
require("oil").setup({})
require("aerial").setup({})
require("fidget").setup({})
require("nvim-tree").setup({})
require("headlines").setup({})
require("diffview").setup({})
require("git-worktree").setup({})
require("tiny-inline-diagnostic").setup()
require("claude-code").setup({})
-- require("wtf").setup({})
require("toggleterm").setup({
	direction = "horizontal",
	open_mapping = [[<c-o>]],
})
require("octo").setup()
require("mini.icons").setup()
require("mini.starter").setup()
vim.keymap.set("n", "<space>e", "<cmd>NvimTreeToggle<CR>", { silent = true, noremap = true, nowait = true })
-- require("avante").setup({
-- })
require("nightfox").setup({
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			types = "italic,bold",
		},
	},
})
