vim.keymap.set("x", "<leader>y", '"+y;', { noremap = true, silent = true, desc = 'Yank to system clipboard' })

require("which-key").add({
	{ "gd", desc = "Go to definition" },
	{ "gtd", desc = "Go to type definition" },

	{ "<leader>c", group = "code" },
	{ "<leader>o", group = "other" },
	{ "<leader>s", group = "surround" },
	{ "<leader>x", group = "trouble" },

	{ "<leader>cr", desc = "Rename" },
	{ "<leader>ca", desc = "Code actions" },
})
