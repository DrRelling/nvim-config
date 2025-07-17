require("config.options")
require("config.lazy")
require("config.whichkey")

vim.lsp.enable({
	"angularls",
	"luals",
	"vtsls",
	"eslint",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method("textDocument/completion") then
			vim.opt.completeopt = { "menu", "menuone", "noinsert" }

			client.server_capabilities.completionProvider.triggerCharacters = {
				".",
			}
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		local opts = { buffer = args.buf }
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

