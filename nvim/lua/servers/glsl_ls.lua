return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = "glsl",
	}
	local name = "glsl_analyzer"
	return { name, config }
end
