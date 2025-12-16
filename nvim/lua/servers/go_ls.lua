return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = "go",
	}
	local name = "gopls"
	return { name, config }
end
