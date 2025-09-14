vim.g.icloud = "/Users/clp/Library/Mobile Documents/com~apple~CloudDocs"
vim.g.wiki_templates = "/wiki/templates"
vim.g.homed = "/Users/clp/d"
vim.g.homea = "/Users/clp/a"
vim.g.homeb = "/Users/clp/b"
vim.g.homec = "/Users/clp/c"
return {
  {
    dir = "/Users/clp/a/down/down.nvim",
    enabled = false,
  },
  {
    "vimwiki/vimwiki",
    branch = "dev",
    lazy = false,
    keys = {
      {
        "<leader>wi",
        function()
          vim.cmd("VimwikiIndex")
        end,
        desc = "Open Vimwiki Index",
      },
      {
        "<leader>w<tab>",
        function()
          vim.cmd("VimwikiTabIndex")
        end,
        desc = "Open Vimwiki Tab Index",
      },
      {
        "<leader>wf",
        function()
          vim.cmd("VimwikiSearch")
        end,
        desc = "Search Vimwiki",
      },
      {
        "<leader>wl",
        function()
          vim.cmd("VimwikiList")
        end,
        desc = "List Vimwiki",
      },
      {
        "<leader>wn",
        function()
          vim.cmd("VimwikiNew")
        end,
        desc = "New Vimwiki Page",
      },
      {
        "<leader>wd",
        function()
          vim.cmd("VimwikiDiaryIndex")
        end,
        desc = "Open Vimwiki Diary Index",
      },
      {
        "<leader>wD",
        function()
          vim.cmd("VimwikiDiaryGenerateLinks")
        end,
        desc = "Generate Vimwiki Diary Links",
      },
      {
        "<leader>wN",
        function()
          vim.cmd("VimwikiToggleList")
        end,
        desc = "Toggle Vimwiki List",
      },
      {
        "<leader>wh",
        function()
          vim.cmd("VimwikiToggleHeader")
        end,
        desc = "Toggle Vimwiki Header",
      },
      {
        "<leader>w<space>",
        function()
          vim.cmd("VimwikiMakeDiaryNote")
        end,
        desc = "Make diary note",
      },
      {
        "<leader>wt",
        function()
          vim.cmd("VimwikiMakeTomorrowDiaryNote")
        end,
        desc = "Make tomorrow diary note",
      },
      {
        "<leader>wy",
        function()
          vim.cmd("VimwikiMakeYesterdayDiaryNote")
        end,
        desc = "Make yesterday diary note",
      },
      {
        ",w,",
        function()
          vim.cmd("VimwikiMakeDiaryNote")
        end,
        desc = "Make diary note",
      },
      {
        ",wt",
        function()
          vim.cmd("VimwikiMakeTomorrowDiaryNote")
        end,
        desc = "Make tomorrow diary note",
      },
      {
        ",wy",
        function()
          vim.cmd("VimwikiMakeYesterdayDiaryNote")
        end,
        desc = "Make yesterday diary note",
      },
    },
    init = function()
      vim.g.vimwiki_list = {
        {
          template_path = "/Users/clp/wiki/templates",
          syntax = "markdown",
          ext = ".md",
          path = "/Users/clp/wiki",
        },
        {
          template_path = "/Users/clp/d/wiki/templates",
          syntax = "markdown",
          ext = ".md",
          path = "/Users/clp/d/wiki",
        },
        {
          template_path = "/Users/clp/c/wiki/templates",
          syntax = "markdown",
          ext = ".md",
          path = "/Users/clp/c/wiki",
        },
        {
          template_path = vim.g.icloud .. "/wiki/templates",
          syntax = "markdown",
          ext = ".md",
          path = vim.g.icloud .. "/wiki",
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  },
}
