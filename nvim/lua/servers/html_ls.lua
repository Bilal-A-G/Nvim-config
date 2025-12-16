return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = "html",
	}
	local name = "html"
	return { name, config }
end
