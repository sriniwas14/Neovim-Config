return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "Trouble", "TroubleToggle", "TroubleClose", "TroubleRefresh" }, -- Ensure all commands trigger loading
	config = function()
		require("trouble").setup({
			position = "bottom",
			height = 10,
			mode = "workspace_diagnostics",
			auto_open = false,
			auto_close = false,
			auto_preview = false,
			signs = {
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "﫠"
			},
			use_diagnostic_signs = true
		})
	end,
}

