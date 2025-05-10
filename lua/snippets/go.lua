-- ~/.config/nvim/lua/snippets/go.lua
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s("fn", fmt("func {}({}) {} {{\n\t{}\n}}", {
		i(1, "name"), i(2, "args"), i(3, "return"), i(4, "// body"),
	})),
}
