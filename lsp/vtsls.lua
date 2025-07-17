-- local mason_path = vim.fn.stdpath("data") ..  "/mason/packages/vtsls"

return {
	cmd = { "vtsls", "--stdio" },
  filetypes = { "typescript", "javascript" },
  root_markers = { "tsconfig.json", "package.json" },
}
