return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		-- mason-lspconfig setup
		require("mason-lspconfig").setup({
			ensure_installed = { "pyright", "gopls", "lua_ls" }, -- Ensure LSPs are installed
		})


		local lspconfig = require("lspconfig")


		local servers = require("mason-lspconfig").get_installed_servers()

		for _, server in ipairs(servers) do
			lspconfig[server].setup {}
		end
	end,
}
