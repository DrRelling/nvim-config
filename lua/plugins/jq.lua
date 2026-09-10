return {
	"cenk1cenk2/jq.nvim",
	config = function()
		require("jq").setup()
	end,
	dependencies = {
		-- https://github.com/nvim-lua/plenary.nvim
		"nvim-lua/plenary.nvim",
		-- https://github.com/MunifTanjim/nui.nvim
		"MunifTanjim/nui.nvim",
		-- https://github.com/grapp-dev/nui-components.nvim
		"grapp-dev/nui-components.nvim",
	},
}
