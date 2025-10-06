local key = vim.keymap.set
local o = { silent = true, nowait = true, noremap = true }
local function d(od)
	return { silent = true, nowait = true, noremap = true, desc = od }
end
local function m(mo, k, c, o)
	key(mo, k, c, o)
end
local function v(k, c, o)
	if type(o) == "table" then
		key({ "v" }, k, c, o)
	elseif type(o) == "string" then
		key({ "v" }, k, c, d(o))
	else
		key({ "v" }, k, c, d(c))
	end
end
local function c(k, c, o)
	if type(o) == "table" then
		key({ "c" }, k, c, o)
	elseif type(o) == "string" then
		key({ "c" }, k, c, d(o))
	else
		key({ "c" }, k, c, d(c))
	end
end
local function i(k, c, o)
	if type(o) == "table" then
		key({ "i" }, k, c, o)
	elseif type(o) == "string" then
		key({ "i" }, k, c, d(o))
	else
		key({ "i" }, k, c, d(c))
	end
end
local function n(k, c, o)
	if type(o) == "string" then
		key({ "n" }, k, c, d(o))
	elseif type(o) == "table" then
		key({ "n" }, k, c, o)
	else
		key({ "n" }, k, c, d(c))
	end
end
n(";", ":", { silent = false })

n("<c-j>", "<c-w>j", { silent = true, nowait = true, noremap = true })
n("<c-h>", "<c-w>h", { silent = true, nowait = true, noremap = true })
n("<c-k>", "<c-w>k", { silent = true, nowait = true, noremap = true })
n("<c-l>", "<c-w>l", { silent = true, nowait = true, noremap = true })

c("<c-a>", "<home>", { silent = true, nowait = true, noremap = true })
c("<c-e>", "<end>", { silent = true, nowait = true, noremap = true })
c("<c-f>", "<right>", { silent = true, nowait = true, noremap = true })
c("<c-b>", "<left>", { silent = true, nowait = true, noremap = true })

m({ "c", "i" }, "<c-a>", "<home>", { silent = true, nowait = true, noremap = true })
m({ "c", "i" }, "<c-e>", "<end>", { silent = true, nowait = true, noremap = true })
m({ "c", "i" }, "<c-f>", "<right>", { silent = true, nowait = true, noremap = true })
m({ "c", "i" }, "<c-b>", "<left>", { silent = true, nowait = true, noremap = true })

n("H", "<CMD>bp<CR>", { silent = true })
n("L", "<CMD>bn<CR>", { silent = true })
v("H", "<CMD>bp<CR>", { silent = true })
v("L", "<CMD>bn<CR>", { silent = true })

n("<tab>", "<CMD>lua vim.diagnostic.goto_next()<CR>", { silent = true, desc = "Next diagnostic" })
n("<s-tab>", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { silent = true, desc = "Prev diagnostic" })
v("<tab>", "<CMD>lua vim.diagnostic.goto_next()<CR>", { silent = true, desc = "Next diagnostic" })
v("<s-tab>", "<CMD>lua vim.diagnostic.goto_prev()<CR>", { silent = true, desc = "Prev diagnostic" })
n("<space><cr>", "<CMD>cd %:p:h<CR>", { silent = true, desc = "Line diagnostic" })
n("<space>ld", "<CMD>lua vim.diagnostic.open_float()<CR>", { silent = true, desc = "Line diagnostic" })
n("<space>lD", "<CMD>lua vim.diagnostic.show()<CR>", { silent = true, desc = "Show line diagnostic" })

n("<space>f.", "<CMD>Telescope find_files cwd=%:p:h<CR>", { silent = true, desc = "Format File" })
n("<space>ff", "<CMD>Telescope find_files<CR>", { silent = true, desc = "Find Files" })
n("<space>fr", "<CMD>Telescope oldfiles<CR>", { silent = true, desc = "Recent Files" })
n("<space>fc", "<CMD>Telescope commands<CR>", { silent = true, desc = "Commands" })
n("<space>fh", "<CMD>Telescope help_tags<CR>", { silent = true, desc = "Help Tags" })
n("<space>fm", "<CMD>Telescope marks<CR>", { silent = true, desc = "Marks" })
n("<space>ft", "<CMD>Telescope treesitter<CR>", { silent = true, desc = "Treesitter" })
n("<space>fs", "<CMD>Telescope lsp_document_symbols<CR>", { silent = true, desc = "Document Symbols" })
n("<space>fS", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>", { silent = true, desc = "Workspace Symbols" })
n("<space>fgb", "<CMD>Telescope git_branches<CR>", { silent = true, desc = "Git Branches" })
n("<space>fgc", "<CMD>Telescope git_commits<CR>", { silent = true, desc = "Git Commits" })
n("<space>fgs", "<CMD>Telescope git_status<CR>", { silent = true, desc = "Git Status" })
n("<space>fg", "<CMD>Telescope live_grep<CR>", { silent = true, desc = "Live Grep" })
n("<space>fb", "<CMD>Telescope buffers<CR>", { silent = true, desc = "Find Buffers" })
n("<space><bs>", "<CMD>nohl<CR>", { silent = true })
n("<space>so", "<CMD>so %<CR>", { silent = true })
n("<space>rr", "<esc>:%s///g<left><left><left>", { silent = false })
n("<space>rW", "<esc>:%s/<C-R>=expand('<cWORD>')<CR>//g<left><left>", { silent = false })
n("<space>rw", "<esc>:%s/<C-R>=expand('<cword>')<CR>//g<left><left>", { silent = false })
n("<space>rx", "<esc>:%s/<C-R>=expand('<cexpr>')<CR>//g<left><left>", { silent = false })
n("<space>rR", "<esc>:%s///gi<left><left><left><left>", { silent = false })

n("<space>vc", "<CMD>e ~/.config/iv/init.lua<CR>", { silent = true, desc = "init.lua" })
n("<space>vs", "<CMD>e ~/.config/iv/lua/setup.lua<CR>", { silent = true, desc = "lua/setup.lua" })
n("<space>vk", "<CMD>e ~/.config/iv/lua/keymaps.lua<CR>", { silent = true, desc = "keymaps.lua" })
n("<space>vp", "<CMD>e ~/.config/iv/lua/plugins.lua<CR>", { silent = true, desc = "plugins.lua" })
n("<space>vo", "<CMD>e ~/.config/iv/lua/opts.lua<CR>", { silent = true, desc = "opts.lua" })
n("<space>va", "<CMD>e ~/.config/iv/lua/abbrev.lua<CR>", { silent = true, desc = "abbrev.lua" })
n("<space>vl", "<CMD>e ~/.config/iv/lua/lsp.lua<CR>", { silent = true, desc = "lsp.lua" })
n("<space>vv", "<CMD>Telescope find_files cwd=~/.config/iv<CR>", { silent = true, desc = "find" })
n("<space>vf", "<CMD>Telescope find_files cwd=~/.config/iv<CR>", { silent = true, desc = "find" })
n("<space>vg", "<CMD>Telescope live_grep cwd=~/.config/iv<CR>", { silent = true, desc = "grep" })
vim.cmd([[
  nm 0 ^
  nm <space>vi <CMD>e ~/.config/iv/init.lua<CR>
]])
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
