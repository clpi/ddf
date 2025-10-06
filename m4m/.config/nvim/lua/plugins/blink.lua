return {
	{ -- Autocompletion
		"saghen/blink.cmp",
		event = "VimEnter",
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
				opts = {},
			},
			"folke/lazydev.nvim",
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default' (recommended) for mappings similar to built-in completions
				--   <c-y> to accept ([y]es) the completion.
				--    This will auto-import if your LSP supports it.
				--    This will expand snippets if the LSP sent a snippet.
				-- 'super-tab' for tab to accept
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- For an understanding of why the 'default' preset is recommended,
				-- you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				--
				-- All presets have the following mappings:
				-- <tab>/<s-tab>: move to right/left of your snippet expansion
				-- <c-space>: Open menu or open docs if already open
				-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
				-- <c-e>: Hide menu
				-- <c-k>: Toggle signature help
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = "enter",

				["<S-TAB>"] = nil,
				["<C-E>"] = nil,
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

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},
			sources = {
				default = { "lsp", "path", "snippets" },
			},

			cmdline = {
				enabled = false,
			},
			completion = {
				accept = {
					auto_brackets = {
						enabled = true,
					},
				},
				list = {
					selection = {
						preselect = true,
					},
				},
				menu = {
					auto_show = true,
					enabled = true,
					auto_show_delay_ms = 0,
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						components = {
							label = {
								width = { fill = true, max = 60 },
								text = function(c)
									local hi = require("colorful-menu").blink_highlights(c)
									if hi ~= nil then
										return hi.label
									else
										return c.label
									end
								end,
								highlight = function(c)
									local h = {}
									local hi = require("colorful-menu").blink_highlights(c)
									if hi ~= nil then
										h = hi.highlights
									end
									for _, i in ipairs(c.label_matched_indices) do
										table.insert(h, { i, i + 1, group = "BlinkCmpLabelMatach" })
									end
									return h
								end,
							},
						},
						treesitter = { "lsp" },
						padding = { 0, 1 },
						-- components = {
						-- 	kind_icon = {
						-- 		text = function(c)
						-- 			return " " .. c.kind_icon .. c.icon_gap .. " "
						-- 		end,
						-- 	},
						-- },
					},
				},
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = {
					treesitter_highlighting = true,
					auto_show = true,
					auto_show_delay_ms = 0,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},

			snippets = { preset = "luasnip" },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			-- fuzzy = { implementation = "lua" },

			fuzzy = { implementation = "prefer_rust" },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},
	{
		"xzbdmw/colorful-menu.nvim",
		enabled = true,
		dependencies = {
			{ "onsails/lspkind.nvim", opts = {} },
		},
		opts = {
			ls = {
				lua_ls = {
					-- Maybe you want to dim arguments a bit.
					arguments_hl = "@comment",
				},
				gopls = {
					align_type_to_right = true,
					add_colon_before_type = false,
					preserve_type_when_truncate = true,
				},
				ts_ls = {
					extra_info_hl = "@comment",
				},
				vtsls = {
					-- false means do not include any extra info,
					-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
					extra_info_hl = "@comment",
				},
				["rust-analyzer"] = {
					-- Such as (as Iterator), (use std::io).
					extra_info_hl = "@comment",
					-- Similar to the same setting of gopls.
					align_type_to_right = true,
					-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
					preserve_type_when_truncate = true,
				},
				clangd = {
					-- Such as "From <stdio.h>".
					extra_info_hl = "@comment",
					-- Similar to the same setting of gopls.
					align_type_to_right = true,
					-- the hl group of leading dot of "•std::filesystem::permissions(..)"
					import_dot_hl = "@comment",
					-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
					preserve_type_when_truncate = true,
				},
				zls = {
					-- Similar to the same setting of gopls.
					align_type_to_right = true,
				},
				roslyn = {
					extra_info_hl = "@comment",
				},
				dartls = {
					extra_info_hl = "@comment",
				},
				-- The same applies to pyright/pylance
				basedpyright = {
					-- It is usually import path such as "os"
					extra_info_hl = "@comment",
				},
				pylsp = {
					extra_info_hl = "@comment",
					-- Dim the function argument area, which is the main
					-- difference with pyright.
					arguments_hl = "@comment",
				},
				-- If true, try to highlight "not supported" languages.
				fallback = true,
				-- this will be applied to label description for unsupport languages
				fallback_extra_info_hl = "@comment",
			},
			-- If the built-in logic fails to find a suitable highlight group for a label,
			-- this highlight is applied to the label.
			fallback_highlight = "@variable",
			-- If provided, the plugin truncates the final displayed text to
			-- this width (measured in display cells). Any highlights that extend
			-- beyond the truncation point are ignored. When set to a float
			-- between 0 and 1, it'll be treated as percentage of the width of
			-- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
			-- Default 60.
			max_width = 60,
		},
	},
}
