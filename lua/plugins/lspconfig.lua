return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		lspconfig.gleam.setup({})

		-- Automatically set up LSP servers
		local servers = mason_lspconfig.get_installed_servers()

		for _, server in ipairs(servers) do
			local opts = {
				on_attach = function(client, bufnr)
					-- Optional: Add keymaps, etc.
				end,
			}

		if server == "lua_ls" then
			opts.settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
						path = vim.split(package.path, ";"), -- optional but useful
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					}, 
				},
			}
		end

			lspconfig[server].setup(opts)
		end
		-- for _, server in ipairs(servers) do
		-- 	lspconfig[server].setup({
		-- 		-- Add server-specific configuration here
		-- 		on_attach = function(client, bufnr)
		-- 			-- Example: Set key mappings, etc.
		-- 		end,
		-- 	})
		-- end

		lspconfig.gopls.setup({
			on_attach = function(client, bufnr)
				if client.server_capabilities.documentFormattingProvider then
					vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
				end
			end,
		})

				
		lspconfig.clangd.setup({
		  on_attach = function(client, bufnr)
			-- Enable formatting if clangd supports it
			if client.server_capabilities.documentFormattingProvider then
			  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
			end
		  end,
		})


	end,
}
