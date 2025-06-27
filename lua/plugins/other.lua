return {
	"rgroli/other.nvim",
	config = function ()
		require("other-nvim").setup({
			mappings = {
				"angular"
			}
		})
	end,
	keys = {
    { "<leader>o", "<cmd>:Other<CR>", desc = "Open Other window" },
	}
}
