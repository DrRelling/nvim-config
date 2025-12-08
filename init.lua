require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.lazygit")

vim.lsp.enable({
	"angularls",
	"luals",
	"eslint",
    "vtsls",
	"java",
    "python"
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
		vim.keymap.set("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua Snacks.picker.lsp_references()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>", opts)
		vim.keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})

