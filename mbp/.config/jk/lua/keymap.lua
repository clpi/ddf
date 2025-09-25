local set_mark = function(id, path, desc)
	require("mini.files").set_bookmark(id, path, { desc = desc })
end
local set_cwd = function()
	local path = (require("mini.files").get_fs_entry() or {}).path
	if path == nil then
		return vim.notify("Cursor is not on valid entry")
	end
	vim.fn.chdir(vim.fs.dirname(path))
end
local minifiles_toggle = function(...)
	if not require("mini.files").close() then
		require("mini.files").open(...)
	end
end
vim.keymap.set("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end, { desc = "Rename This" })
vim.keymap.set("n", "<leader>ls", "<cmd>Pick lsp scope='document_symbol'<cr>", { desc = "Show all Symbols" })

vim.keymap.set("n", "<leader>la", function()
	vim.lsp.buf.code_action()
end, { desc = "Code Actions" })
vim.keymap.set("n", ",m", function()
	require("mini.map").open()
end, { desc = "Open Mini Map" })
vim.keymap.set("n", "<leader>ll", function()
	require("mini.extra").pickers.explorer({ scope = "current" })
end, {})
vim.keymap.set("n", ",B", function()
	require("mini.extra").buf_lines()
end, {})
vim.keymap.set("n", "<leader>le", function()
	require("mini.extra").pickers.diagnostic({ scope = "current" })
end, {})
vim.keymap.set("n", ",d", function()
	require("mini.extra").pickers.diagnostic({ scope = "current" })
end, {})
vim.keymap.set("n", ",.", function()
	require("mini.extra").pickers.explorer({ cwd = "~/.config", scope = "current" })
end, {})
vim.keymap.set("n", ",D", function()
	require("mini.extra").pickers.diagnostic({ scope = "all" })
end, {})
vim.keymap.set("n", ",e", function()
	require("mini.extra").pickers.diagnostic({ get_opts = { severity = "warn" }, sort_by = "severity", scope = "all" })
end, {})
vim.keymap.set("n", ",ld", function()
	require("mini.extra").pickers.lsp({ scope = "definition" })
end, {})
vim.keymap.set("n", ",lD", function()
	require("mini.extra").pickers.lsp({ scope = "declaration" })
end, {})
vim.keymap.set("n", ",lt", function()
	require("mini.extra").pickers.lsp({ scope = "type_definition" })
end, {})
vim.keymap.set("n", ",/", function()
	require("mini.extra").pickers.history({ scope = "/" })
end, {})
vim.keymap.set("n", "<space>/", function()
	require("mini.extra").pickers.history({ scope = "/" })
end, {})
vim.keymap.set("n", ",li", function()
	require("mini.extra").pickers.lsp({ scope = "implementation" })
end, {})
vim.keymap.set("n", ",lr", function()
	require("mini.extra").pickers.lsp({ scope = "references" })
end, {})
vim.keymap.set("n", ",ls", function()
	require("mini.extra").pickers.lsp({ scope = "document_symbol" })
end, {})
vim.keymap.set("n", ",lS", function()
	require("mini.extra").pickers.lsp({ scope = "workspace_symbol" })
end, {})
vim.keymap.set("n", ",p", function()
	require("mini.extra").pickers.visit_paths()
end, { desc = "Visit Paths" })
vim.keymap.set("n", "<leader>;", function()
	require("mini.extra").pickers.history()
end, {})
vim.keymap.set("n", "<leader>:", function()
	require("mini.extra").pickers.commands()
end, {})
vim.keymap.set("n", "<leader>:", function()
	require("mini.extra").pickers.commands()
end, {})
vim.keymap.set("n", "<leader>ld", function()
	require("mini.extra").pickers.diagnostic({ scope = "current" })
end, {})
vim.keymap.set("n", "<leader>lq", function()
	vim.diagnostic.setqflist({ open = true })
end, { desc = "LSP Quickfix" })
vim.keymap.set("n", "<leader>lf", function()
	vim.diagnostic.setqflist({ open = true })
end, { desc = "LSP Quickfix" })

vim.keymap.set("n", "<Leader>mc", require("mini.map").close)
vim.keymap.set("n", "<Leader>mf", require("mini.map").toggle_focus)
vim.keymap.set("n", "<Leader>mo", require("mini.map").open)
vim.keymap.set("n", "<Leader>mr", require("mini.map").refresh)
vim.keymap.set("n", "<Leader>ms", require("mini.map").toggle_side)
vim.keymap.set("n", "<Leader>mt", require("mini.map").toggle)

vim.cmd([[
   nno ; :
   nno H :bp<CR>
   nno U :redo<CR>
   nno L :bn<CR>
   nno <C-h> <CMD>wincmd h<CR>
   nno <C-k> <CMD>wincmd k<CR>
   nno <C-j> <CMD>wincmd j<CR>
   nno <C-l> <CMD>wincmd l<CR>
   nno ,vv :e ~/.config/jk/init.lua<CR>
   nno ,vt :e ~/.config/jk/lua/deps/config/treesitter.lua<CR>
   nno ,vT :e ~/.config/jk/lua/deps/config/telescope.lua<CR>
   nno ,vl :e ~/.config/jk/lua/deps/config/lsp/init.lua<CR>
   nno ,vL :e ~/.config/jk/lua/deps/config/lsp/lua.lua<CR>
   nno ,vA :e ~/.config/jk/lua/deps/config/lsp/ai.lua<CR>
   nno ,va :e ~/.config/jk/lua/deps/config/ai.lua<CR>
   nno ,vd :e ~/.config/jk/lua/deps/init.lua<CR>
   nno ,vc :e ~/.config/jk/lua/deps/config/init.lua<CR>
   nno ,vm :e ~/.config/jk/lua/deps/config/mini.lua<CR>
   nno ,vk :e ~/.config/jk/lua/keymap.lua<CR>
   nno ,vo :e ~/.config/jk/lua/opts.lua<CR>
   " nno ,va :e ~/.config/jk/lua/deps/config/ai.lua<CR>
   nno <space><bs> <CMD>nohlsearch<CR>
   nno ,vs :e ~/.config/jk/lua/setup.lua<CR>
  ]])
vim.cmd([[
  nno ,f :Pick files<CR>
   nno ; :
   nno H :bp<CR>
   nno L :bn<CR>
  nno ,h <CMD>Pick history<CR>
  nno ,b <CMD>Pick buffers<CR>
  nno ,l <CMD>Pick lsp<CR>
  nno ,H <CMD>Pick help<CR>
  nno ,d <CMD>Pick diagnostic<CR>
  nno ,e <CMD>Pick explorer<CR>
  nno ,f <CMD>Pick files<CR>
  nno ,o <CMD>Pick oldfiles<CR>
  nno ,O <CMD>Pick visit_paths<CR>
  nno ,. <CMD>Pick grep_live<CR>
  cabbrev tl Telescope
  nno ,g <CMD>Pick grep_live<CR>
  set pumblend=11 winblend=14
  set pumheight=0
  set gdefault
  set conceallevel=3
  set concealcursor=nvic
  set cmdheight=0
  set numberwidth=3
  set noswapfile
  ]])
local l = vim.lsp
local d = vim.diagnostic
local o = function(about)
	return { desc = about, silent = true, nowait = true }
end
local n = function(k, c, about)
	vim.keymap.set("n", k, c, o(about))
end

n("<tab>", d.goto_next, "next diagnostic")
n("<s-tab>", d.goto_prev, "next diagnostic")
n("--", d.open_float, "open float")
n("-r", l.codelens.run, "run codelens")
n("-h", l.buf.hover, "hover")
n("-a", l.buf.code_action, "run codeaction")
n("gd", l.buf.definition, "definition")
n("gD", l.buf.declaration, "declaration")
n("gt", l.buf.type_definition, "type_definition")
n("gt", l.buf.implementation, "implementation")
n("gr", l.buf.references, "refs")
n("-d", l.buf.list_workspace_folders, "folders")
n("-h", l.buf.document_highlight, "doc hl")
n("gT", l.buf.typehierarchy, "doc hl")
n("-W", function()
	l.buf.add_workspace_folder(vim.uri_to_fname(vim.uri_from_bufnr(0)))
end, "add cwd to folders")
n("gT", function()
	l.util.buf_highlight_references(0, l.buf.references(nil, {
		loclist = true,
		on_list = function(e)
			print(e)
		end,
	}) or {}, "utf-16")
end, "hl refs")
n("gT", l.util.buf_highlight_references, "doc hl")
n("-d", l.diagnostic.get_line_diagnostics, "line diag")
n("-d", function()
	l.buf.rename(vim.ui.input({ prompt = "rename" }, function(err, val)
		print(err, val)
	end))
end, "rename")
n("-s", l.buf.document_symbol, "doc symbols")
n("-S", l.buf.workspace_symbol, "workspace symbols")
n("-f", l.buf.format, "definition")
n("-i", function()
	l.inlay_hint.get({ bufnr = 0 })
end, "inlay")
