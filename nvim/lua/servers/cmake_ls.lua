return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = "cmake",
	}
	local name = "cmake"
	return { name, config }
end
