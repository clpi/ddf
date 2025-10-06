vim.keymap.set("n", ",e", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.api.nvim_create_augroup("DapGroup", { clear = true })
vim.keymap.set("n", "<space>.", "<CMD>so %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<space><CR>", "<CMD>cd %:p:h<CR>", { desc = "Change directory to current file" })
local function navigate(args)
	local buffer = args.buf

	local wid = nil
	local win_ids = vim.api.nvim_list_wins() -- Get all window IDs
	for _, win_id in ipairs(win_ids) do
		local win_bufnr = vim.api.nvim_win_get_buf(win_id)
		if win_bufnr == buffer then
			wid = win_id
		end
	end

	if wid == nil then
		return
	end

	vim.schedule(function()
		if vim.api.nvim_win_is_valid(wid) then
			vim.api.nvim_set_current_win(wid)
		end
	end)
end

local function create_nav_options(name)
	return {
		group = "DapGroup",
		pattern = string.format("*%s*", name),
		callback = navigate,
	}
end
return {

	{ "RRethy/nvim-treesitter-endwise", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "folke/sidekick.nvim", opts = {} },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		enabled = false,
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local function layout(name)
				return {
					elements = {
						{ id = name },
					},
					enter = true,
					size = 40,
					position = "right",
				}
			end
			local name_to_layout = {
				repl = { layout = layout("repl"), index = 0 },
				stacks = { layout = layout("stacks"), index = 0 },
				scopes = { layout = layout("scopes"), index = 0 },
				console = { layout = layout("console"), index = 0 },
				watches = { layout = layout("watches"), index = 0 },
				breakpoints = { layout = layout("breakpoints"), index = 0 },
			}
			local layouts = {}

			for name, config in pairs(name_to_layout) do
				table.insert(layouts, config.layout)
				name_to_layout[name].index = #layouts
			end

			local function toggle_debug_ui(name)
				dapui.close()
				local layout_config = name_to_layout[name]

				if layout_config == nil then
					error(string.format("bad name: %s", name))
				end

				local uis = vim.api.nvim_list_uis()[1]
				if uis ~= nil then
					layout_config.size = uis.width
				end

				pcall(dapui.toggle, layout_config.index)
			end

			vim.keymap.set("n", "<leader>dr", function()
				toggle_debug_ui("repl")
			end, { desc = "Debug: toggle repl ui" })
			vim.keymap.set("n", "<leader>ds", function()
				toggle_debug_ui("stacks")
			end, { desc = "Debug: toggle stacks ui" })
			vim.keymap.set("n", "<leader>dw", function()
				toggle_debug_ui("watches")
			end, { desc = "Debug: toggle watches ui" })
			vim.keymap.set("n", "<leader>db", function()
				toggle_debug_ui("breakpoints")
			end, { desc = "Debug: toggle breakpoints ui" })
			vim.keymap.set("n", "<leader>dS", function()
				toggle_debug_ui("scopes")
			end, { desc = "Debug: toggle scopes ui" })
			vim.keymap.set("n", "<leader>dc", function()
				toggle_debug_ui("console")
			end, { desc = "Debug: toggle console ui" })

			vim.api.nvim_create_autocmd("BufEnter", {
				group = "DapGroup",
				pattern = "*dap-repl*",
				callback = function()
					vim.wo.wrap = true
				end,
			})

			vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options("dap-repl"))
			vim.api.nvim_create_autocmd("BufWinEnter", create_nav_options("DAP Watches"))

			dapui.setup({
				layouts = layouts,
				enter = true,
			})

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			dap.listeners.after.event_output.dapui_config = function(_, body)
				if body.category == "console" then
					dapui.eval(body.output) -- Sends stdout/stderr to Console
				end
			end
		end,
	},
	{ "m-demare/hlargs.nvim", opts = {} },
	{ "folke/noice.nvim", opts = {} },
	{
		"jay-babu/mason-nvim-dap.nvim",
		enabled = false,
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"delve",
				},
				automatic_installation = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
					delve = function(config)
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file args",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		config = function()
			local dap = require("dap")
			dap.set_log_level("DEBUG")

			vim.keymap.set("n", "<F8>", dap.continue, { desc = "Debug: Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Conditional Breakpoint" })
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"fredrikaverpil/neotest-golang",
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-golang")({
						dap = { justMyCode = false },
					}),
				},
			})

			vim.keymap.set("n", "<leader>tr", function()
				require("neotest").run.run({
					suite = false,
					testify = true,
				})
			end, { desc = "Debug: Running Nearest Test" })

			vim.keymap.set("n", "<leader>tv", function()
				require("neotest").summary.toggle()
			end, { desc = "Debug: Summary Toggle" })

			vim.keymap.set("n", "<leader>ts", function()
				require("neotest").run.run({
					suite = true,
					testify = true,
				})
			end, { desc = "Debug: Running Test Suite" })

			vim.keymap.set("n", "<leader>td", function()
				require("neotest").run.run({
					suite = false,
					testify = true,
					strategy = "dap",
				})
			end, { desc = "Debug: Debug Nearest Test" })

			vim.keymap.set("n", "<leader>to", function()
				require("neotest").output.open()
			end, { desc = "Debug: Open test output" })

			vim.keymap.set("n", "<leader>ta", function()
				require("neotest").run.run(vim.fn.getcwd())
			end, { desc = "Debug: Open test output" })
		end,
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
	{ "stevearc/overseer.nvim", opts = {} },
	{ "stevearc/aerial.nvim", opts = {} },
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 5000,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					c = { "clang-format" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					go = { "gofmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					elixir = { "mix" },
				},
				formatters = {
					["clang-format"] = {
						prepend_args = { "-style=file", "-fallback-style=LLVM" },
					},
				},
			})

			vim.keymap.set("n", "<leader>f", function()
				require("conform").format({ bufnr = 0 })
			end)
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{ "stevearc/dressing.nvim", opts = {} },
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{
		"saghen/blink.cmp",
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
				nerd_font_variant = "mono",
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

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
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"Saghen/blink.cmp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {},
			})
			local lspconfig = require("lspconfig")
			local on_attach = function(client, bufnr)
				local function buf_set_option(...)
					vim.api.nvim_buf_set_option(bufnr, ...)
				end
				buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
				local opts = { noremap = true, silent = true }
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<leader>wa",
					"<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
					opts
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<leader>wr",
					"<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
					opts
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<leader>wl",
					"<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
					opts
				)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<Cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
			end
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
			local servers = { "lua_ls", "tsserver", "rust_analyzer", "pyright", "gopls" }
			for _, lsp in ipairs(servers) do
				vim.lsp.config(lsp, {
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end,
	},

	{
		"mason-org/mason.nvim",
		opts = {
			install_root_dir = "/Users/clp/.local/share/nvim/mason",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
			},
			automatic_enable = true,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"numToStr/Comment.nvim", -- Optional
			"nvim-telescope/telescope.nvim", -- Optional
		},
	},
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	{
		"akinsho/toggleterm.nvim",
		opts = { autochdir = true, open_mapping = [[<C-O>]], direction = "horizontal" },
	},
	{
		"folke/snacks.nvim",
		opts = {},
	},
	{
		"folke/ts-comments.nvim",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		opts = {},
	},
	{
		"folke/edgy.nvim",
		opts = {},
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle()
			end)

			vim.keymap.set("n", "[t", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end)

			vim.keymap.set("n", "]t", function()
				require("trouble").previous({ skip_groups = true, jump = true })
			end)
		end,
	},
	{
		"folke/neoconf.nvim",
		opts = {},
	},
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "nvim-lualine/lualine.nvim", opts = {} },
	{ "nvim-tree/nvim-tree.lua", opts = {} },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-telescope/telescope.nvim", opts = {} },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "folke/which-key.nvim", opts = {} },

	{ "lewis6991/gitsigns.nvim", opts = {} },
	-- {"numToStr/Comment.nvim"},
	{ "windwp/nvim-autopairs", opts = {} },
	{ "windwp/nvim-ts-autotag", opts = {} },
	{ "akinsho/bufferline.nvim", version = "v3.*", dependencies = { "nvim-tree/nvim-web-devicons" } },
	-- {"lukas-reineke/indent-blankline.nvim"},
	-- {"goolord/alpha-nvim"},
	-- {"folke/tokyonight.nvim"},
	-- {"catppuccin/nvim",name="catppuccin"},
	{ "rebelot/kanagawa.nvim" },
	-- {"EdenEast/nightfox.nvim"},
	{ "nvim-mini/mini.animate", version = false, opts = {} },
	{ "nvim-mini/mini.diff", version = false, opts = {} },
	{ "nvim-mini/mini.starter", version = false, opts = {} },
	{ "nvim-mini/mini.cursorword", version = false, opts = {} },
	{ "nvim-mini/mini.hipatterns", version = false, opts = {} },
	{ "nvim-mini/mini.clue", enabled = false, version = false, opts = {} },
	{ "nvim-mini/mini.indentscope", version = false, opts = {} },
	{ "nvim-mini/mini.icons", version = false, opts = {} },
	{ "nvim-mini/mini.bufremove", version = false, opts = {} },
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false, -- Enable multiwindow support.
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
	},
	{ "github/copilot.vim" },
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "OXY2DEV/markview.nvim" },
		lazy = false,
	},
	{ "MagicDuck/grug-far.nvim", opts = {} },
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Disable default virtual text
		end,
	},
}
