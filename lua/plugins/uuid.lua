return {
	"TrevorS/uuid-nvim",
	lazy = true,
	config = function()
		require("uuid-nvim").setup({
			case = "lower",
			quotes = "none",
			insert = "before",
		})
	end,
}
