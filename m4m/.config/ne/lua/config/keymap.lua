local k = vim.keymap.set
local s = { silent = true, noremap = true, nowait = true }
k("n", "<space>vi", "<CMD>e ~/.config/ne/init.lua<CR>")
k("n", "<space>/", "<CMD>Telescope live_grep<CR>")
k("n", "<space>?", "<CMD>Telescope live_grep cwd=%:p:h<CR>")
k("n", "<space>ff", "<CMD>Telescope find_files<CR>")
k("n", "<space>fF", "<CMD>Telescope find_files hidden=true cwd=%:p:h<CR>")
k("n", "<space>fg", "<CMD>Telescope live_grep<CR>")
k("n", "<space>fb", "<CMD>Telescope buffers<CR>")
k("n", "<space>fh", "<CMD>Telescope help_tags<CR>")
k("n", "<space>vrc", "<CMD>e ~/.config/ne/lua/config/init.lua<CR>")
k("n", "<space>vp", "<CMD>e ~/.config/ne/lua/plugins.lua<CR>")
k("n", "<space>vk", "<CMD>e ~/.config/ne/lua/config/keymap.lua<CR>")
k("n", "<space>vc", "<CMD>e ~/.config/ne/lua/config/init.lua<CR>")
k("n", "<space>vo", "<CMD>e ~/.config/ne/lua/config/opts.lua<CR>")
k("n", "<space>vl", "<CMD>e ~/.config/ne/lua/lsp/init.lua<CR>")
k("n", ";", ":")
k({"v", "n"}, "<tab>", function() vim.diagnostic.jump({count=1})end, s)
k({"v", "n"}, "<s-tab>", function() vim.diagnostic.jump({count=-1})end, s)
k("n", "<space>.", ":so %<CR>")
k("n", "H", ":bp<CR>")
k("n", "L", ":bn<CR>")
k("n", "<Leader>_", "<cmd>vsplit<CR>", s) -- Split the window vertically
k("n", "<Leader>-", "<cmd>split<CR>", s) -- Split the window horizontally
k("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP
k("t", "<Esc>", "<C-\\><C-N>") -- Exit terminal mode
k("n", "<space>pu", vim.pack.update)

k({"i", "c"}, "<C-a>", "<Home>") -- Move to the beginning of the line
k({"i", "c"}, "<C-e>", "<End>")  -- Move to
k({"i", "c"}, "<C-b>", "<Left>") -- Move one character to the left
k({"i", "c"}, "<C-f>", "<Right>") -- Move one character

k({"n", "v"}, "<C-j>", "<C-w>j") -- Move to the window below
k({"n", "v"}, "<C-k>", "<C-w>k") -- Move
k({"n", "v"}, "<C-h>", "<C-w>h") -- Move to the window on the left
k({"n", "v"}, "<C-l>", "<C-w>l") -- Move
