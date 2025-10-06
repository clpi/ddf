return {
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
    enabled = false,
    completion = {
      auto_show = true,
    },
		keymap = {
			preset = "enter",
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},

	sources = { default = { "lsp", "path", "snippets" } },
	keymap = {
    ["<Tab>"] = {
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
