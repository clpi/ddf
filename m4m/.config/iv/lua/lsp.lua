-- vim.diagnostic.config({
--   virtual_text = true,
-- })
vim.lsp.config("nil", {
	cmd = { "nil", "--stdio" },
	filetypes = { "nix" },
	settings = {
		nix = {
			nixpkgs = {
				path = "/home/ryan/.nix-defexpr/channels/nixpkgs",
			},
			formatting = {
				command = { "nixpkgs-fmt" },
			},
		},
	},
})
