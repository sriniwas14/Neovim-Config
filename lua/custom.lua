
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({
			async = false,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})

-- Show inline errors

vim.diagnostic.config({
	virtual_text = {
		prefix = '●', -- Can be '■', '▎', '●', or even a space
		spacing = 4,
	},
})
