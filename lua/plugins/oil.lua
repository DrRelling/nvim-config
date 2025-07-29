return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  opts = {},
	config = function()
		require('oil').setup({
			delete_to_trash = true,
		})
	end,
	keys = {
		-- { "<leader>O", "<CMD>Oil --float<CR>", desc = "Open Oil (float)" },
	},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
