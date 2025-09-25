require("nvim-treesitter.configs").setup{
  ensure_installed = {
    'vimdoc', 'luadoc', 'luap', 'lua', 'fennel',
    'c', 'cpp', 'rust', 'python', 'go', 'typescript', 'javascript',
    'tsx', 'markdown', 'markdown_inline',
    'tmux',
  },
  sync_install = true,
  auto_install = true,
  ignore_install = {},
  modules = {
    autotag = { enable = true },
    endwise = { enable = true },
    context = { enable = true },
    highlight = { enable = true },
    indent = { enable = true },
  }
}


-- require('down').setup({
--   dev = true,
--   test = true,
--   workspace = {
--     default = "wiki",
--     workspaces = {
--       book = "~/down.nvim/book/src/",
--       wiki = "~/Library/Mobile Documents/com~apple~CloudDocs/wiki",
--       notes = "~/notes",
--       clp = "~/clp",
--     }
--   }
-- })

require("trouble").setup{}

require("nvim-autopairs").setup()

require("aerial").setup()

require "lazydev".setup {
  enabled = true,
  debug = true,
  runtime = vim.env.VIMRUNTIME,
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    -- { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    "nvim-treesitter",
    "telescope.nvim",
    "nio.nvim",
    "plenary.nvim",
    "pathlib.nvim",
    "nui.nvim",
    "dressing.nvim",
  },
  integrations = {
    lspconfig = true,
    cmp = false,
    coq = false,
  }
}
