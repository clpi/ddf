return {
	-- mini.icons
{
	"echasnovski/mini.hipatterns",
	opts = {}
},
{
	"echasnovski/mini.surround",
	opts = {}
},
{
	"echasnovski/mini.animate",
	opts = {}
},
{
	"echasnovski/mini.indentscope",
	opts = {}
},
{
	"echasnovski/mini.comment",
	opts = {}
},
{
	"echasnovski/mini.icons",
	opts = {}
},
{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
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
    keymap = { preset = 'enter' },
		appearance = {
      nerd_font_variant = 'normal',
			use_nvim_cmp_as_default = false,
			-- highlight_ns = 0,

		},
		signature = { 

			window = {
				min_width = 100,
				winblend = 10,
				treesitter_highlighting = true,
				border = "none",
				show_documentation = true
			},
			enabled = true 
		},



		completion = {
			menu = {
				-- treesitter_highlighting = {
				-- 	"lsp"
				-- },
				winblend = 10,
				min_width = 90,
				draw = {
					padding = {
						0, 1
					}

				},
				border  = "none",
				auto_show = true
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
				treesitter_highlighting = true,
				update_delay_ms = 50,
				window = {
					winblend = 10,
					desired_min_height = 200,
					min_width = 100,
					border = "none"
				}
			}
		},
		term = {
			completion = {
				list = {
					selection = {
						preselect = true,
						auto_insert = true,
					}
				}
			}
		},

			-- menu = {
			-- 	draw = {
			-- 		padding = { 0, 1 },
			-- 		components = {
			-- 			kind_icon = {
			-- 				text = function(k)
			-- 					return ' ' .. k.kind_icon .. k.icon_gap .. ' ' 
			-- 				end
			-- 			}
			-- 		}
			-- 	},


    -- (Default) Only show the documentation popup when manually triggered

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'codecompanion', 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { 
			implementation = "prefer_rust_with_warning" 
		},
	},

  opts_extend = { "sources.default" }
} -- blink

}
