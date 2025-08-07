return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			formatters = {
				file = {
					filename_first = true,
					truncate = 80
				}
			}
		},
		explorer = {
            follow_file = false
        }
	},
	keys = {
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
        { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
        { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
        { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
        { "<leader>fc", function() Snacks.picker.cliphist() end, desc = "Clip History" },
        { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notification History" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
	}
}
