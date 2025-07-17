require("config.options")
require("config.lazy")

vim.lsp.enable({
	"angularls",
	"luals",
	"vtsls",
	"eslint",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

require("which-key").add({
	{ "gd", desc = "Go to definition" },
	{ "gtd", desc = "Go to type definition" },

	{ "<leader>c", group = "code" },
	{ "<leader>cr", desc = "Rename" },
	{ "<leader>ca", desc = "Code actions" },

	{ "<leader>o", group = "other" },
})
