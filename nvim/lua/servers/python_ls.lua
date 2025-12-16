return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = { "python" },
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					useLibraryCodeForTypes = true,
					autoImportCompletions = true,
				},
			},
		},
	}
	local name = "pyright"
	return { name, config }
end
