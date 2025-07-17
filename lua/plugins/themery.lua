return {
	"zaldih/themery.nvim",
	dependencies = {
		{ "ellisonleao/gruvbox.nvim" },
		{ "shaunsingh/nord.nvim" },
	},
	lazy = false,
	config = function()
		require("themery").setup({
			themes = { "gruvbox", "nord" },
		})
	end,
}
