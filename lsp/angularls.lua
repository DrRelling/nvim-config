local mason_path = vim.fn.stdpath("data") ..  "/mason/packages/angular-language-server"

return {
  cmd = {
		'ngserver',
		'--stdio',
		'--tsProbeLocations', mason_path,
		'--ngProbeLocations', mason_path,
		'--angularCoreVersion', '18'
	},
  filetypes = { "typescript", "html", "htmlangular" },
  root_markers = { "angular.json", "nx.json" },
}
