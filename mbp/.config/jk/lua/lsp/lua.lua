local M = {}
M.settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim" },
        },
        telemetry = { enable = false },
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
      },
    }
M.setup = function()
    require("lspconfig").lua_ls.setup({
    settings = M.settings,
    on_init = function(c)
      local path = c.workspace_folders[1].name
      if c.workspace_folders then
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          return
        end
      end
      c.config.settings.Lua = vim.tbl_deep_extend('force', c.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT'
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,

          }
        }
      })
    end
  }) end

return M
