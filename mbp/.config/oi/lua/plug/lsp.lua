return {
	{
		'neovim/nvim-lspconfig',
		after = { "folke/neoconf.nvim"},
		dependencies = { 'saghen/blink.cmp' },

		opts = {
			servers = {
				lua_ls = {}
			}
		},
		-- config = function(_, opts)
		-- 	local lspconfig = require('lspconfig')
		-- 	for server, config in pairs(opts.servers) do
		-- 		-- passing config.capabilities to blink.cmp merges with the capabilities in your
		-- 		-- `opts[server].capabilities, if you've defined it
		-- 		config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
		-- 		lspconfig[server].setup(config)
		-- 	end
		-- end,

		-- -- example calling setup directly for each LSP
		--  config = function()
		--    local capabilities = require('blink.cmp').get_lsp_capabilities()
		--    local lspconfig = require('lspconfig')

		--    lspconfig['lua_ls'].setup({ capabilities = capabilities })
		--  end
	},
  {
    "mason-org/mason.nvim",
    opts = {
      -- install_root_dir = path.concat { vim.fn.stdpath "data" "mason"},
      install_root_dir = "/Users/clp/.local/share/nvim/mason",
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
},
{
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
}
