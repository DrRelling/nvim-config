return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	opts = function(_, opts)
		opts.formatters = {
			["google-java-format"] = {
				command = "java",
				args = { "-jar", "/home/afoster/code/google-java-format-1.28.0-all-deps.jar", "--aosp", "$FILENAME" },
			},
		}

		opts.formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			htmlangular = { "prettierd", "prettier", stop_after_first = true },
			java = { "google-java-format" },
		}

		opts.default_format_opts = {
			lsp_format = "fallback",
		}

		return opts
	end,
}
