return {
	'jose-elias-alvarez/null-ls.nvim',
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- gofmt
				null_ls.builtins.formatting.gofmt,
				-- golines
				null_ls.builtins.formatting.golines.with({
					extra_args = { "--max-len=100", "--reformat-tags" },
				}),
				-- goimports
				null_ls.builtins.formatting.goimports,
				-- prettier
				null_ls.builtins.formatting.prettier,
			},
		})
	end
}
