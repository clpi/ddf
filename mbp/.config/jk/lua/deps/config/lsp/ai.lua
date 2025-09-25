local M = {
  settings = {
    memory = {
      file_store = {}
    },
    completion = {
      model = "qwen2.5-coder",
      type = "ollama",
      parameters = {
        max_tokens = 32,
        max_context = 1024,
      }
    },
    models = {
      ["deepseek-r1"] = {
        type = "ollama",
        model = "deepseek-r1:latest"
      },
      ["qwen2.5-coder"] = {
        type = "ollama",
        model = "qwen2.5-coder:latest"
      }
    }
  }
}
M.setup = function()
  require("lspconfig").lsp_ai.setup{
    settings = M.settings,
  }
end
return M

