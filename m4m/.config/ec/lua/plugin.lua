local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
vim.opt.swapfile = false

add({
  source="MeanderingProgrammer/render-markdown.nvim", 
  depends = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim"}
})
add({
  source = "CopilotC-Nvim/CopilotChat.nvim",
  depends = { "nvim-lua/plenary.nvim" },
})
add({
	source = "neovim/nvim-lspconfig",
	depends = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
})
add("github/copilot.vim")
add("folke/neoconf.nvim")
add("m-demare/hlargs.nvim")
add({ source = "RRethy/nvim-treesitter-endwise", depends = { "nvim-treesitter/nvim-treesitter" } })
add("akinsho/toggleterm.nvim")
add("stevearc/dressing.nvim")
add({ source = "greggh/claude-code.nvim", depends = { "nvim-lua/plenary.nvim" } })
-- add({source='romgrk/barbar.nvim', depends={} )
add("stevearc/overseer.nvim")
add("iamcco/markdown-preview.nvim")
add("stevearc/aerial.nvim")
add("stevearc/oil.nvim")
add("stevearc/conform.nvim")
add("folke/trouble.nvim")
add("folke/snacks.nvim")
-- add({ source = "Exafunction/windsurf.nvim", depends = { "nvim-lua/plenary.nvim" }})
-- add({
-- 	source = "Saghen/blink.cmp",
-- 	-- depends = { "Exafunction/windsurf.nvim" },
-- })
add("nvim-mini/mini.tabline")
add("MagicDuck/grug-far.nvim")
add({
	source = "olimorris/codecompanion.nvim",
	depends = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
})
add("nvim-mini/mini-git")
add("MunifTanjim/nui.nvim")
add({
	source = "yetone/avante.nvim",
	depends = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
})

add("nvim-mini/mini.colors")
add("nvim-mini/mini.basics")
add("nvim-mini/mini.comment")
add("nvim-mini/mini.hues")
add("nvim-mini/mini.test")
add("nvim-mini/mini.visits")
add("nvim-mini/mini.sessions")
add("nvim-mini/mini.notify")
add("nvim-mini/mini.map")
add("nvim-mini/mini.keymap")
add("nvim-mini/mini.splitjoin")
add("nvim-mini/mini.operators")
add("nvim-mini/mini.move")
add("folke/todo-comments.nvim")
add("folke/lazydev.nvim")
add("folke/ts-comments.nvim")
add("nvim-mini/mini.jump")
add("nvim-mini/mini.jump2d")
add("nvim-mini/mini.fuzzy")
add("rachartier/tiny-inline-diagnostic.nvim")
add("nvim-mini/mini.extra")
add("nvim-mini/mini.trailspace")
add("nvim-mini/mini.diff")
add("nvim-mini/mini.ai")
add("nvim-mini/mini.align")
add("nvim-mini/mini.bracketed")
add("nvim-mini/mini.animate")
add("nvim-mini/mini.indentscope")
add("nvim-mini/mini.pick")
add("nvim-mini/mini.files")
-- add  "nvim-mini/mini.colors"
add("nvim-mini/mini.hipatterns")
add("nvim-mini/mini.bufremove")
add("nvim-mini/mini.clue")
add("nvim-mini/mini.misc")
add({ source = "nvim-mini/mini.completion", depends = { "nvim-mini/mini.icons", "nvim-mini/mini.snippets" } })
add("nvim-mini/mini.cursorword")
add("nvim-mini/mini.statusline")
-- add  "nvim-treesitter/nvim-treesitter-context"
-- add  "nvim-treesitter/nvim-treesitter-textobjects"

add("nvim-mini/mini.starter")
add("nvim-mini/mini.snippets")
add("nvim-mini/mini.surround")
add("windwp/nvim-ts-autotag")
-- add("nvim-mini/mini.pairs")
add("windwp/nvim-autopairs")
add("nvim-mini/mini.icons")
add({
	checkout = "master",
	monitor = "main",
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
	},
	source = "nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	ensure_installed = {
		"lua",
	},
})
-- require "treesitter-context".setup()
require("mini.operators").setup({})
require("mini.animate").setup({
	scroll = {
		enable = true,
	},
	open = {
		enable = true,
	},
	close = {
		enable = true,
	},
	resize = {
		enable = true,
	},
	cursor = {
		enable = true,
	},
})
require("mini.trailspace").setup()
require("mini.fuzzy").setup({})
require("mini.visits").setup()
require("mini.test").setup()
-- require("mini.hues").setup()
require("mini.basics").setup({
	options = {
		basic = true,
		extra_ui = true,
		win_borders = "default",
	},
})
local clue = require("mini.clue")
require("mini.clue").setup({
	window = {
		delay = 0,
	},
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<space>" },
		{ mode = "n", keys = "," },
		{ mode = "x", keys = "<Leader>" },
		{ mode = "x", keys = "," },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.windows(),
		clue.gen_clues.z(),
	},
})
require("mini.indentscope").setup({
	draw = {
		delay = 50,
	},
})
require("mini.notify").setup()
local ms = require("mini.starter")
require("mini.starter").setup({
	evaluate_single = true,
	items = {
		ms.sections.pick(),
		ms.sections.builtin_actions(),
		ms.sections.recent_files(15, false),
		ms.sections.recent_files(15, true),
		ms.sections.sessions(5, true),
	},
	content_hooks = {
		ms.gen_hook.adding_bullet(),
		ms.gen_hook.indexing("all", { "Builtin actions" }),
		ms.gen_hook.padding(4, 4),
		ms.gen_hook.aligning("center", "center"),
	},
})
local sl = require("mini.statusline")
local mode, modehl = sl.section_mode({ trunc_width = 120 })
require("mini.statusline").setup({
	use_icons = true,

	content = {
		inactive = function()
			return sl.combine_groups({
				{ hl = modehl, strings = { mode } },
				{
					hl = "MiniStatuslineDevInfo",
					strings = {
						sl.section_git({ trunc_width = 40 }),
						sl.section_diff({ trunc_width = 75 }),
						sl.section_diagnostics({ trunc_width = 75 }),
						sl.section_lsp({ trunc_width = 75 }),
					},
				},
				"%<",
				{ hl = "MiniStatuslineFilename", strings = { sl.section_filename({ trunc_width = 140 }) } },
				"%=",
				{ hl = "MiniStatuslineFileinfo", strings = { sl.section_fileinfo({ trunc_width = 120 }) } },
				{
					hl = modehl,
					strings = { sl.section_searchcount({ trunc_width = 75 }), sl.section_location({ trunc_width = 75 }) },
				},
			})
		end,
		active = function()
			return sl.combine_groups({
				{ hl = modehl, strings = { mode } },
				{
					hl = "MiniStatuslineDevInfo",
					strings = {
						sl.section_git({ trunc_width = 40 }),
						sl.section_diff({ trunc_width = 75 }),
						sl.section_diagnostics({ trunc_width = 75 }),
						sl.section_lsp({ trunc_width = 75 }),
					},
				},
				"%<",
				{ hl = "MiniStatuslineFilename", strings = { sl.section_filename({ trunc_width = 140 }) } },
				"%=",
				{ hl = "MiniStatuslineFileinfo", strings = { sl.section_fileinfo({ trunc_width = 120 }) } },
				{
					hl = modehl,
					strings = { sl.section_searchcount({ trunc_width = 75 }), sl.section_location({ trunc_width = 75 }) },
				},
			})
		end,
	},
})
require("mini.pick").setup({
	delay = {
		async = 10,
		busy = 10,
	},
	options = {
		content_from_bottom = true,
		use_cache = true,
	},
})
require("mini.files").setup({
	windows = {
		preview = true,
	},
})
require("mini.align").setup()
require("mini.diff").setup({
	delay = {
		text_change = 100,
	},
})
require("mini.jump").setup()
require("mini.jump2d").setup()
require("lazydev").setup()
require("ts-comments").setup()
require("todo-comments").setup()
require("mini.icons").setup()
require("mini.bracketed").setup()
require("mini.ai").setup()
require("mini.cursorword").setup()
require("mini.bufremove").setup()
require("mini.move").setup()
-- require("tiny-inline-diagnostics").setup()
require("mini.map").setup()
require("mini.git").setup()
require("mini.surround").setup()
-- require("codeium").setup({
-- })
-- require("blink.cmp").setup({
--   sources = {
--     providers = {
--       codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
--     },
--     default = { "lsp", "path", "snippets", "buffer", "codeium", }
--   }
-- })
require("mini.completion").setup({
	delay = {
		completion = 0,
		info = 0,
		signature = 0,
	},
	window = {
		info = {
			height = 25,
			width = 80,
			border = nil,
		},
		lsp_completion = {
			auto_setup = true,
			process_itmes = nil,
			snippet_insert = nil,
			source_func = "completefunc",
		},
		mappings = {
			force_twostep = "<C-Space>",
			force_fallback = "<A-Space>",
			scroll_down = "<C-f>",
			scroll_up = "<C-b>",
		},
	},
})

require("dressing").setup()
require("neoconf").setup()
require("trouble").setup()
require("snacks").setup()
require("oil").setup()
require("conform").setup()
require("overseer").setup()
require("aerial").setup()
require("mini.splitjoin").setup()
-- require("mini.pairs").setup()
require("nvim-autopairs").setup()
require("claude-code").setup()
require("avante").setup()
require("mini.sessions").setup()
require("hlargs").setup({})
require("mini.snippets").setup({
	snippets = {
		require("mini.snippets").gen_loader.from_file("~/.config/nvim/snippets/global.json"),
		require("mini.snippets").gen_loader.from_lang(),
	},
})
require("mini.tabline").setup({
	show_icons = true,
})
require("mini.comment").setup()
require("mini.keymap").setup()
require("grug-far").setup()
require("nvim-ts-autotag").setup()
require("mini.basics").setup()
require("mini.extra").setup()
require("codecompanion").setup()
require("mini.misc").setup()
-- require("codeium").setup()
-- require "mini.base16" .setup {}
require("mason").setup({
	install_root_dir = vim.fn.stdpath("data") .. "/../nvim/mason",
})

require("toggleterm").setup({
  direction = "horizontal",
  open_mapping = [[<C-O>]]
})
require("render-markdown").setup()
require("CopilotChat").setup()
require("mason-lspconfig").setup({})
local mm = require("mini.keymap").map_multistep
mm("i", "<c-j>", { "pmenu_next" })
mm("i", "<c-k>", { "pmenu_prev" })
mm("i", "<cr>", { "pmenu_accept", "minipairs_cr" })
mm("i", "<bs>", { "minipairs_bs" })
