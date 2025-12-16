return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = "css",
	}
	local name = "cssls"
	return { name, config }
end
