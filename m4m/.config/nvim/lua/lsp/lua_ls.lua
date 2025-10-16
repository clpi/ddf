---@type vim.lsp.Config
return {
  name = "lua_ls",
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
  ---@type vim.lsp.Config
    settings = {
      Lua = {
        telemetry = { enable = false },
        runtime = {
          path = {
            "?.lua",
            "?/init.lua",
            vim.fn.expand("$VIMRUNTIME/lua/?.lua"),
            vim.fn.expand("$VIMRUNTIME/lua/?/init.lua"),
        },
          version = "LuaJIT",
        },
        completion = {
          enable = true,
        },
        diagnostics = {
          enable = true,
          globals = { "vim" },
        },
      
        workspace = {
          library = { vim.env.VIMRUNTIME },
          checkThirdParty = false,
        },
      },
  },
}

