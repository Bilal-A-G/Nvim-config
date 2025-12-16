return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = {
			"c",
			"cpp",
		},
		cmd = { "clangd", "--header-insertion=iwyu" },
	}
	local name = "clangd"
	return { name, config }
end
