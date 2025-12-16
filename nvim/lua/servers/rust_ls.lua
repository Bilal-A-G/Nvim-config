return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = { "rust" },
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
			},
		},
	}
	local name = "rust_analyzer"
	return { name, config }
end
