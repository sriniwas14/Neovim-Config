return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		lspconfig.gleam.setup({})

		-- Automatically set up LSP servers
		local servers = mason_lspconfig.get_installed_servers()

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				-- Add server-specific configuration here
				on_attach = function(client, bufnr)
					-- Example: Set key mappings, etc.
				end,
			})
		end

		lspconfig.gopls.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
				end
			end,
		})
	end,
}
