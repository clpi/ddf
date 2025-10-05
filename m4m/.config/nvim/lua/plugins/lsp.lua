local api = vim.api
return {
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
	{
		"folke/neoconf.nvim",
		opts = {},
	},
	{
		"b0o/schemastore.nvim",
		config = function()
			local s = require("schemastore")
			vim.lsp.config("jsonls", {
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemaStore = {
							enable = true,
							url = "",
						},
						schemas = require("schemastore").json.schemas(),
					},
				},
			})
		end,
	},
	{ "ray-x/go.nvim" },
	{ "p00f/clangd_extensions.nvim", opts = {} },
	{
		"mrcjkb/rustaceanvim",
		version = "^6", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		"S1M0N38/love2d.nvim",
		enabled = true,
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>v", ft = "lua", desc = "LÖVE" },
			{ "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
			{ "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
		},
	},
	{
		"mythos-404/xmake.nvim",
		enabled = true,
		opts = {},
	},
	{
		"Civitasv/cmake-tools.nvim",
		enabled = true,
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			-- Mason must be loaded before its dependents so we need to set it up here.
			-- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{ "j-hui/fidget.nvim", opts = {} },

			-- Allows extra capabilities provided by blink.cmp
			"saghen/blink.cmp",
		},
		config = function()
			api.nvim_create_autocmd("LspAttach", {
				group = api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local tel = require("telescope.builtin")
					local lsp = vim.lsp
					local buf = lsp.buf
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("grn", buf.rename, "[R]e[n]ame")
					map("gra", buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
					map("grh", buf.hover, "[G]et [H]over", { "n", "x" })
					map("grD", buf.declaration, "[G]oto [D]eclaration")
					map("grr", tel.lsp_references, "[G]oto [R]eferences")
					map("gri", tel.lsp_implementations, "[G]oto [I]mplementation")
					map("grd", tel.lsp_definitions, "[G]oto [D]efinition")
					map("gO", tel.lsp_document_symbols, "Open Document Symbols")
					map("gW", tel.lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
					map("grt", tel.lsp_type_definitions, "[G]oto [T]ype Definition")

					-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
					---@param client vim.lsp.Client
					---@param method vim.lsp.protocol.Method
					---@param bufnr? integer some lsp support methods only in specific files
					---@return boolean
					local function client_supports_method(client, method, bufnr)
						if vim.fn.has("nvim-0.11") == 1 then
							return client:supports_method(method, bufnr)
						else
							return client.supports_method(method, { bufnr = bufnr })
						end
					end
					local client = lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client_supports_method(
							client,
							lsp.protocol.Methods.textDocument_documentHighlight,
							event.buf
						)
					then
						local hlgroup = api.nvim_create_augroup("lsp-highlight", { clear = false })
						local detachgroup = api.nvim_create_augroup("lsp-detach", { clear = true })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = hlgroup,
							callback = buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = hlgroup,
							callback = buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = detachgroup,
							callback = function(event2)
								buf.clear_references()
								api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
							end,
						})
					end
					if
						client
						and client_supports_method(client, lsp.protocol.Methods.textDocument_inlayHint, event.buf)
					then
						map("<leader>th", function()
							lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local servers = {
				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}
			local ensure = vim.tbl_keys(servers or {})
			vim.list_extend(ensure, {
				-- "stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure })
			require("mason-lspconfig").setup({
				ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
