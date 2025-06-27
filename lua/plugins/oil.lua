return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
	keymaps = { 
		["h"] = { "actions.toggle_hidden", mode = "n" }
	},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
}
