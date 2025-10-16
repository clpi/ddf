local cm = require("colorful-menu")
local m = require("minuet")
---@type blink.cmp.Config
return {
	signature = {

		enabled = true,
	},

	fuzzy = {
		implementation = "prefer_rust",
		-- implementation = "prefer_rust_with_warning"
	},
	appearance = {
		nerd_font_variant = "normal",
		use_nvim_cmp_as_default = false,
	},
	completion = {
		trigger = {
			prefetch_on_insert = false,
		},
		menu = {

			draw = {
        treesitter = { "lsp" },
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(c)
							return cm.blink_components_text(c)
						end,
						highlight = function(ctx)
							return cm.blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
		documentation = {
      treesitter_highlighting = true,
			auto_show = true,
			auto_show_delay_ms = 0,
		},
	},
	-- cmdline = {
	--    enabled = false,
	--    completion = {
	--      auto_show = true,
	--    },
	-- 	keymap = {
	-- 		preset = "enter",
	-- 		-- ["<CR>"] = { "accept_and_enter", "fallback" },
	-- 	},
	-- },

	sources = {
		default = {
			"lsp",
			"path",
      "minuet",
      "codecompanion",
      "lazydev",
      "minuet",
			"snippets", ---"minuet", --"codecompanion", "markview"
		},
		providers = {
      lazydev = {
        module = "lazydev.integrations.blink",
        score_offset = 100
      },
			minuet = {
				name = "minuet",
				module = "minuet.blink",
				async = true,
				timeout_ms = 3000,
				score_offset = 50,
			},
		},
	},
	keymap = {
		["<c-y>"] = m.make_blink_map(),
		["<c-k>"] = {
			"snippet_backward",
			function() -- if you are using Neovim's native inline completions
				return vim.lsp.inline_completion.get()
			end,
			"fallback",
		},
		["<c-j>"] = {
			"snippet_forward",
			function() -- sidekick next edit suggestion
				return require("sidekick").nes_jump_or_apply()
			end,
			function() -- if you are using Neovim's native inline completions
				return vim.lsp.inline_completion.get()
			end,
			"fallback",
		},
		preset = "enter",
	},
}
