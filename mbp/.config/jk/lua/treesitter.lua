require("nvim-treesitter").setup({

})
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
  highlight = { enable = true },
  indent = { enable = true },
})

