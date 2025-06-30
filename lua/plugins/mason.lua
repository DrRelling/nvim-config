return {
	"mason-org/mason.nvim",
	dependencies = {
		{
				"mason-org/mason-lspconfig.nvim",
				version  = "1.32.0",
		},
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"angularls",
				"eslint",
				"html",
				"jsonls",
			}
		})

		require("mason-tool-installer").setup({
			"prettier",
			"stylua",
			"eslint_d"
		})
	end
}
