local key = vim.keymap.set
local o = { silent = true, nowait = true, noremap = true }
local function d(od)
	return { silent = true, nowait = true, noremap = true, desc = od }
end
local function m(mo, k, c, o)
	key(mo, k, c, o)
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

n("<space><bs>", "<CMD>nohl<CR>", { silent = true })
n("<space>so", "<CMD>so %<CR>", { silent = true })
n("<space>r", "<esc>:%s///g<left><left><left>", { silent = false })

n("<space>vc", "<CMD>e ~/.config/iv/init.lua<CR>", { silent = true, desc = "init.lua" })
n("<space>vk", "<CMD>e ~/.config/iv/lua/keymaps.lua<CR>", { silent = true, desc = "keymaps.lua" })
n("<space>vp", "<CMD>e ~/.config/iv/lua/plugins.lua<CR>", { silent = true, desc = "plugins.lua" })
n("<space>vo", "<CMD>e ~/.config/iv/lua/opts.lua<CR>", { silent = true, desc = "opts.lua" })
n("<space>va", "<CMD>e ~/.config/iv/lua/abbrev.lua<CR>", { silent = true, desc = "abbrev.lua" })
n("<space>vl", "<CMD>e ~/.config/iv/lua/lsp.lua<CR>", { silent = true, desc = "lsp.lua" })
n("<space>vv", "<CMD>Telescope find_files cwd=~/.config/iv<CR>", { silent = true, desc = "find" })
