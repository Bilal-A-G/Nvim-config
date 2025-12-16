return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = {
			"typescript",
			"javascript",
			"javascriptreact",
			"typescriptreact",
		},
		settings = {
			typescript = {
				indentStyle = "space",
				indentSize = 2,
			},
		},
	}
	local name = "ts_ls"
	return { name, config }
end
