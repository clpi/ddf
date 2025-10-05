local k = vim.keymap.set
local U = {
	ll = function(m)
		return "," .. m
	end,

	lll = function(m)
		return "\\" .. m
	end,

	opt = { silent = true, nowait = true, noremap = true },
	l = function(map)
		return "<space>" .. map
	end,
	kc = function(cmd)
		if type(cmd) == "function" then
			return cmd
		elseif type(cmd) == "string" then
			return "<CMD>" .. cmd .. "<CR>"
		end
	end,
}

---@param o? table|string
---@return table
function U.o(o)
	if type(o) == "table" then
		return o
	elseif type(o) == "string" then
		return vim.tbl_extend("force", U.opt, { desc = o })
	elseif type(o) == "function" then
		return U.opt
	else
		return U.opt
	end
end

return vim.tbl_extend("force", U, {
	v = function(m, c, o)
		k({ "v" }, m, c, U.o(o or c))
	end,
	k = k,
	m = function(m, km, c, o)
		k(m, km, c, U.o(o or c))
	end,
	c = function(m, c, o)
		k({ "c" }, m, c, U.o(o or c))
	end,
	i = function(m, c, o)
		k({ "i" }, m, c, U.o(o or c))
	end,
	n = function(m, c, o)
		k({ "n" }, m, c, U.o(o or c))
	end,
	ln = function(m, c, o)
		k("n", U.l(m), U.kc(c), U.o(o or c))
	end,
	lln = function(m, c, o)
		k("n", U.ll(m), U.kc(c), U.o(o or c))
	end,
	llln = function(m, c, o)
		k("n", U.lll(m), U.kc(c), U.o(o or c))
	end,
})
