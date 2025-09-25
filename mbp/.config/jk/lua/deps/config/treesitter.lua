require("nvim-treesitter").setup({
  extensions = {
    endwise = {
      enable = true,
    },
    context = {
      enable = true,
    },
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  endwise = {
    enable = true,
  },
  context = {
    enable = true,
  },
  ensure_installed = {
    'lua', 'vimdoc',
    'luau', 'luap',
    'fsh', 'bash', 'fish', 'elvish',
    'json', 'c', 'cpp', 'doxygen', 'python',
    'jsonc', 'json5',
    'fennel', 'typst', 'v', 'fsharp',
    'query', 'yaml',
    'markdown', 'markdown_inline',
  }
})

-- require("treesitter-context").setup({
--     separator = '─',
--     multiline_threshold = 1,
--     max_lines = 5
-- })
require('nvim-treesitter.configs').setup({
  extensions = {
    endwise = { enable = true },
    context = { enable = true },
  },
  ensure_installed = {
    'lua', 'vimdoc',
    'luau', 'luap',
    'fsh', 'bash', 'fish', 'elvish',
    'json', 'c', 'cpp', 'doxygen', 'python',
    'jsonc', 'json5',
    'fennel', 'typst', 'v', 'fsharp',
    'query', 'yaml',
    'markdown', 'markdown_inline',
  },
  autotag= {enable = true},
  endwise = { enable = true },
  context = { enable = true },
  highlight = { enable = true },
  indent = { enable = true },
})

