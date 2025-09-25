local mini = require("mini.deps")
local add, now, later = mini.add, mini.now, mini.later
local path_package = vim.fn.stdpath('data') .. '/site/'

now(function() require("mini.deps").setup({
  path = { package = path_package },
  silent = true,
}) end)

local function dep(opt)
	now(function()
		add(opt)
	end)
end
local function next(opt)
	later(function()
		add(opt)
	end)
end

now(function() add({
	source = "nvim-treesitter/nvim-treesitter",
	depends = {
		{ "RRethy/nvim-treesitter-endwise" },
		{ "nvim-treesitter/nvim-treesitter-context" },
		{ "windwp/nvim-ts-autotag" },
	},
	hooks = {
		post_checkout = function()
			vim.cmd("TSUpdate")
		end,
		post_install = function()
			require("nvim-treesitter").setup()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "markdown", "lua", "luap", "vimdoc", "luadoc" },
			})
		end,
	},
}) end)

now(function() add({
	source = "folke/neoconf.nvim",
	hooks = {
		post_install = function()
			require("neoconf").setup({
				live_reload = true,
				filetype_jsonc = true,
				import = {
					coc = true,
					nlsp = true,
					vscode = true,
				},
				plugins = {
					jsonls = {
						enabled = true,
						configured_servers_only = true,
					},
					lua_ls = {
						enabled_for_neovim_config = true,
						enabled = true,
					},
					lspconfig = {
						enabled = true,
					},
				},
			})
		end,
	},
}) end)
now(function() add({
	source = "stevearc/dressing.nvim",
	hooks = {
		post_install = function()
			require("dressing").setup({
				backend = "nui",
				nui = { relative = "cursor", max_width = 40 },
				input = {
					enabled = true,
				},
				select = {
					enabled = true,
					backend = { "telescope", "nui", "builtin", "fzf", "fzf_lua" },
					-- telescope = require("telescope.themes").get_ivy,
				},
			})
		end,
	},
}) end)
now(function() add({
	source = "stevearc/overseer.nvim",
	hooks = {
		post_install = function()
			require("overseer").setup({
				strategy = "terminal",
				templates = { "builtin" },
				dap = true,
				form = {
					border = "none",
					win_opts = {
						winblend = 14,
					},
				},
				task_list = {
					direction = "bottom",
					bindings = {
						["?"] = "ShowHelp",
						["g?"] = "ShowHelp",
						["<CR>"] = "RunAction",
						["<C-e>"] = "Edit",
						["o"] = "Open",
						["<C-v>"] = "OpenVsplit",
						["<C-s>"] = "OpenSplit",
						["<C-f>"] = "OpenFloat",
						["<C-q>"] = "OpenQuickFix",
						["p"] = "TogglePreview",
						["<C-l>"] = "IncreaseDetail",
						["<C-h>"] = "DecreaseDetail",
						["L"] = "IncreaseAllDetail",
						["H"] = "DecreaseAllDetail",
						["["] = "DecreaseWidth",
						["]"] = "IncreaseWidth",
						["{"] = "PrevTask",
						["}"] = "NextTask",
						["<C-k>"] = "ScrollOutputUp",
						["<C-j>"] = "ScrollOutputDown",
						["q"] = "Close",
					},
				},
			})
		end,
	},
}) end)
now(function() add({
	source = "HakonHarnes/img-clip.nvim",
	hooks = {
		post_install = function()
			require("img-clip").setup({})
		end,
	},
}) end)
now(function() add({
	source = "Shatur/neovim-ayu",
	hooks = {
		post_install = function()
			require("ayu").setup({})
		end,
	},
}) end)
now(function() add({
	source = "MeanderingProgrammer/render-markdown.nvim",
	hooks = {
		post_install = function()
			require("render-markdown").setup({})
		end,
	},
}) end)
now(function() add({
	source = "stevearc/conform.nvim",
	hooks = {
		post_install = function()
			require("conform").setup({})
		end,
	},
}) end)
now(function() add({
	source = "folke/todo-comments.nvim",
}) end)
now(function() add({
	source = "neovim/nvim-lspconfig",
	depends = {
		"williamboman/mason.nvim",
		"b0o/SchemaStore.nvim",
	},
	hooks = {
		post_install = function()
			local dir = vim.fs.joinpath(vim.fs.dirname(vim.fn.stdpath("data")), "mason") ---@diagnostic disable-line
			if not vim.fn.isdirectory(dir) then
				vim.fn.mkdir(dir, "p")
			end
			require("neoconf").setup({
				runtime = vim.env.VIMRUNTIME,
				integrations = {
					lspconfig = true,
					cmp = false,
					coq = false,
				},
				plugins = {
					lspconfig = {
						enabled = true,
					},
					lua_ls = {
						enabled = true,
						enabled_for_neovim_config = true,
					},
					jsonls = {
						enabled = true,
						configured_servers_only = false,
					},
				},
			})
			require("mason").setup({
				install_root_dir = dir,
				automatic_installation = true,
				ensure_installed = {},
			})
			require("lspconfig").lua_ls.setup({
				setttings = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = {
							"vim",
							"_",
						},
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.fn.expand(vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"),
							vim.fn.expand(vim.env.VIMRUNTIME .. "/lua"),
							vim.fn.expand(vim.env.VIMRUNTIME .. "/lua/vim/lsp"),
						},
					},
				},
			})
		end,
	},
}) end)
now(function() add({
	source = "folke/trouble.nvim",
	hooks = {
		post_install = function()
			require("trouble").setup({
				auto_preview = true,
				auto_open = true,
			})
		end,
	},
}) end)
now(function() add({
	source = "folke/lsp-colors.nvim",
	hooks = {
		post_install = function()
			local colors = require("ayu.colors")
			colors.generate(false)
			require("lsp-colors").setup({
				Error = colors.error,
				Warning = colors.warning,
				Information = colors.cyan,
				Hint = colors.green,
			})
		end,
	},
}) end)
now(function() add({
	source = "Bilal2453/luvit-meta",
}) end)
now(function() add({
	source = "folke/lazydev.nvim",
	depends = {
		"neovim/nvim-lspconfig",
	},
	hooks = {
		post_install = function()
			require("lazydev").setup({
				enabled = true,
				debug = true,
				runtime = vim.env.VIMRUNTIME,
				library = {
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
					-- { path = "${3rd}/luv/library", words = { "vim%.uv" } },
					"nvim-treesitter",
					"telescope.nvim",
					"nvim-nio",
					"plenary.nvim",
					"pathlib.nvim",
					"nui.nvim",
					"dressing.nvim",
				},
				integrations = {
					lspconfig = true,
					cmp = false,
					coq = false,
				},
			})
		end,
	},
}) end)
now(function() add({
	source = "williamboman/mason.nvim",
	-- hooks = {
		-- post_install = function()
		-- 	require("mason").setup()
		-- end,
	-- },
}) end)
now(function() add({
  source = "Mythos-404/xmake.nvim"
}) end)
-- now(function() add({
--   source = "Civitasv/cmake-tools.nvim",
-- }) end)
now(function() add({
  source = "S1M0N38/love2d.nvim",
}) end)
now(function() add({
	source = "williamboman/mason-lspconfig.nvim",
	depends = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	-- hooks = {
	-- 	post_install = function()
	-- 		require("mason-lspconfig").setup({
	-- 			automatic_installation = true,
	-- 			ensure_installed = {
	-- 				"clangd",
	-- 				"lua_ls",
	-- 				"jsonls",
	-- 				"kotlin_language_server",
	-- 				"gopls",
	-- 				"rust_analyzer",
	-- 				"zls",
	-- 				"ts_ls",
	-- 				"pyright",
	-- 				"nimls",
	-- 				"julials",
	-- 				"yamlls",
	-- 				"vls",
	-- 				"taplo",
	-- 				-- "denols",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}) end)
now(function() add({
	source = "yetone/avante.nvim",
	hooks = {
		post_install = function()
			vim.cmd("make")
			require("avante").setup({
				provider = "copilot",

				behaviour = {
					auto_suggestions = true,
					auto_set_highlight_group = true,
					auto_set_keymaps = true,
					auto_apply_diff_after_generation = true,
					support_paste_from_clipboard = true,
				},
				hints = { enabled = true },
			})
		end,
	},
	depends = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"zbirenbaum/copilot.lua",
		"MeanderingProgrammer/render-markdown.nvim",
		"echasnovski/mini.icons",
	},
}) end)

now(function() add({
	source = "sourcegraph/sg.nvim",
	depends = { "nvim-lua/plenary.nvim" },
	hooks = {
		post_install = function()
			require("sg").setup({
				download__binaries = true,
				node_executable = "/Users/clp/.volta/bin/node",
				skip_node_check = true,
				chat = {
					-- default_model =
				},
				accept_tos = true,
				download_binaries = true,
			})
		end,
	},
}) end)
now(function() add({
	source = "j-hui/fidget.nvim",
	hooks = {
		post_install = function()
			require("fidget").setup({})
		end,
	},
}) end)
now(function() add({
	source = "olimorris/codecompanion.nvim",
	depends = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
		"stevearc/dressing.nvim",
	},
	hooks = {
		post_install = function()
			require("codecompanion").setup({
				provider = "copilot",
				strategy = {
					chat = {
						adapter = "copilot",
					},
					inline = {
						adapter = "copilot",
					},
				},
			})
		end,
	},
}) end)

now(function() add({
	source = "stevearc/aerial.nvim",
	hooks = {
		post_install = function()
			require("aerial").setup({
				backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
			})
			require("telescope").load_extension("aerial")
		end,
	},
	depends = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}) end)
now(function() add({
	source = "jvgrootveld/telescope-zoxide",
	depends = { "nvim-telescope/telescope.nvim" },
	hooks = {
		post_install = function()
			require("telescope").load_extension("zoxide")
		end,
	},
}) end)
now(function() add({
	source = "nvim-lua/plenary.nvim",
}) end)

now(function() add({
	source = "CopilotC-Nvim/CopilotChat.nvim",
	checkout = "main",
	hooks = {
		post_install = function()
			require("CopilotChat").setup({
				auto_insert_mode = true,
				debug = true,
				chat_autocomplete = true,
				highlight_headers = true,
				show_help = true,
				auto_follow_cursor = true,
				highlight_selection = true,
				show_folds = true,
				allow_insecure = true,
			})
		end,
	},
	depends = {
		"zbirenbaum/copilot.lua", -- or github/copilot.vim
		"nvim-lua/plenary.nvim", -- for curl, log wrapper
	},
}) end)

now(function() add({
	source = "windwp/nvim-autopairs",
	hooks = {
		post_install = function()
			require("nvim-autopairs").setup({})
		end,
	},
}) end)

-- dep({
--   source = "folke/tokyonight.nvim",
-- })
-- dep({
--   source = "~/down/down.nvim",
--   hooks = {
--     post_checkout = function()
--       require("down").setup({
--         dev = true,
--         debug = true,
--         test = true,
--         workspace = {
--           default = "wiki",
--           workspaces = {
--             clp = "~/clp",
--             notes = "~/notes",
--             wiki = "~/Library/Mobile Documents/com~apple~CloudDocs/wiki",
--             default = "~/wiki"
--           }
--         },
--         hook = function()
--           vim.inspect('hook', { depth = 3, newline = "\n", process = function(item, path)
--             vim.print(item, path)
--           end})
--         end
--       })
--     end
--   },
--   depends = {
--     "nvim-lua/plenary.nvim",
--     "nvim-telescope/telescope.nvim",
--     "MunifTanjim/nui.nvim",
--     "nvim-treesitter/nvim-treesitter",
--     "zbirenbaum/copilot.lua",
--     "pysan3/pathlib.nvim",
--     "nvim-neotest/nvim-nio",
--   },
-- })
now(function() add({
	source = "yarospace/lua-console.nvim",
	hooks = {
		post_install = function()
			require("lua-console").setup({
				buffer = {
					autosave = true,
				},
			})
		end,
	},
}) end)

now(function() add({
	source = "zbirenbaum/copilot.lua", -- for providers='copilot'
	depends = {
		"nvim-lua/plenary.nvim",
	},
	hooks = {
		post_install = function()
			require("copilot").setup({
				panel = {
					enabled = true,
				},
				suggestions = {
					enabled = true,
				},
			})
		end,
	},
}) end)

now(function() add({
	source = "Exafunction/codeium.nvim",
	hooks = {
		post_install = function()
			require("codeium").setup({})
		end,
	},
}) end)

now(function() add({
	source = "folke/edgy.nvim",
	hooks = {
		post_install = function()
			require("edgy").setup({ ---@diagnostic disable-line
				close_when_all_hidden = true,
				debug = true,
				exit_when_last = true,
				animate = true,
			})
		end,
	},
}) end)

now(function() add({
	source = "neanias/everforest-nvim",
	hook = {
		post_install = function()
			require("everforest").setup({})
		end,
	},
}) end)
now(function() add({
	source = "nvim-telescope/telescope-file-browser.nvim",
	hooks = {
		post_install = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	depends = {
		"nvim-telescope/telescope.nvim",
	},
}) end)
now(function() add({
	source = "nvim-telescope/telescope.nvim",
	hooks = {
		post_install = function()
			require("telescope").setup({})
		end,
	},
}) end)
now(function() add({
	source = "SmiteshP/nvim-navic",
	depends = { "neovim/nvim-lspconfig" },
	hooks = {
		post_install = function()
			require("nvim-navic").setup({
				lsp = {
					auto_attach = true,
					preference = {},
				},
			})
		end,
	},
}) end)
now(function() add({
	source = "windwp/nvim-ts-autotag",
	depends = { "nvim-treesitter/nvim-treesitter" },
	hooks = {
		post_install = function()
			require("nvim-ts-autotag").setup({
				did_setup = {},
				get_opts = {},
				setup = {},
			})
		end,
	},
}) end)
now(function() add({
	source = "LhKipp/nvim-nu",
	hooks = {
		post_install = function()
			require("nvim-nu").setup()
		end,
	},
}) end)
now(function() add({
	source = "milanglacier/minuet-ai.nvim",
	hooks = {
		post_install = function()
			require("minuet").setup({})
		end,
	},
}) end)
-- dep {
--   souce = "ibhagwan/fzf-lua",
--   hooks = {
--     post_install = function()
--       require("fzf-lua").init({})
--     end
--   }
-- }
now(function() add({
	source = "ThePrimeagen/refactoring.nvim",
	depends = { "nvim-telescope/telescope.nvim" },
	hooks = {
		post_install = function()
			require("telescope").load_extension("refactoring")
		end,
	},
})  end)
now(function() add({
	source = "nvim-telescope/telescope-frecency.nvim",
	depends = { "nvim-telescope/telescope.nvim" },
	hooks = {
		post_install = function()
			require("telescope").load_extension("frecency")
		end,
	},
}) end)
now(function() add({
  source= 'MagicDuck/grug-far.nvim'
}) end)
now(function() add({
	source = "rachartier/tiny-inline-diagnostic.nvim",
	hooks = {
		post_install = function()
			require("tiny-inline-diagnostic").setup({})
			vim.fn.sign_define("DiagnosticSignError", { text = "✘", texthl = "DiagnosticSignError", icon = "✘" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", icon = "" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", icon = "" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", icon = "" })
		end,
	},
}) end)

add("Mythos-404/xmake.nvim")
now(function()
  require("xmake").setup()
end)
now(function()
  require("avante_lib").load()
end)
now(function()
    require("grug-far").setup()
end)

later(function()
  require("xmake").setup({})
  require("love2d").setup({})
  -- require("cmake-tools").setup({})
end)
