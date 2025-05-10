vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if not args.data then return end

		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		if client and client.server_capabilities.documentFormattingProvider then
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, { buffer = bufnr, desc = "Format code" })
		end
	end,
})


vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(args)
		local buf = args.buf
		local clients = vim.lsp.get_active_clients({ bufnr = buf })
		for _, client in ipairs(clients) do
			if client.server_capabilities.documentFormattingProvider then
				vim.lsp.buf.format({ bufnr = buf })
				break
			end
		end
	end,
})
