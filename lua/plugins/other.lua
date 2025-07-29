local angular_less = {
	{
		pattern = "/(.*)/(.*)/([a-zA-Z-_]*).*.ts$",
		target = {
			{
				target = "/%1/%2/%3.component.html",
				context = "html",
			},
			{
				target = "/%1/%2/%3.component.less",
				context = "styles",
			},
			{
				target = "/%1/%2/%3.*.less",
				context = "other styles",
			},
			{
				target = "/%1/%2/%3.component.spec.ts",
				context = "test",
			},
		},
	},
	{
		pattern = "/(.*)/(.*)/([a-zA-Z-_]*).*html$",
		target = {
			{
				target = "/%1/%2/%3.component.ts",
				context = "component",
			},
			{
				target = "/%1/%2/%3.component.less",
				context = "styles",
			},
			{
				target = "/%1/%2/%3.component.spec.ts",
				context = "test",
			},
		},
	},
	{
		pattern = "/(.*)/(.*)/([a-zA-Z-_]*).*less$",
		target = {
			{
				target = "/%1/%2/%3.component.html",
				context = "html",
			},
			{
				target = "/%1/%2/%3.component.ts",
				context = "component",
			},
			{
				target = "/%1/%2/%3.component.spec.ts",
				context = "test",
			},
		},
	},
	{
		pattern = "/(.*)/(.*)/([a-zA-Z-_]*).*spec.ts$",
		target = {
			{
				target = "/%1/%2/%3.component.html",
				context = "html",
			},
			{
				target = "/%1/%2/%3.component.less",
				context = "styles",
			},
			{
				target = "/%1/%2/%3.component.ts",
				context = "component",
			},
		},
	},
	{
		pattern = "/(.*)/(.*).service.ts$",
		target = {
			{
				target = "/%1/%2.service.spec.ts",
				context = "test",
			},
		},
	},
	{
		pattern = "/(.*)/(.*).service.spec.ts$",
		target = {
			{
				target = "/%1/%2.service.ts",
				context = "service",
			},
		},
	}
}

return {
	"rgroli/other.nvim",
	config = function ()
		require("other-nvim").setup({
			mappings = angular_less
		})
	end,
	keys = {
    { "<leader>O", "<cmd>:Other<CR>", desc = "Open Other window (this buffer)" },
    { "<leader>ot", "<cmd>:OtherTabNew<CR>", desc = "Open Other window (new tab)" },
    { "<leader>oh", "<cmd>:OtherSplit<CR>", desc = "Open Other window (horizontal split)" },
    { "<leader>ov", "<cmd>:OtherVSplit<CR>", desc = "Open Other window (vertical split)" },
	}
}
