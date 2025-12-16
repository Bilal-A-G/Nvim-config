return function(on_attach)
	local config = {
		on_attach = on_attach,
		filetypes = {
			"sh",
			"zsh",
		},
	}
	local name = "bashls"
	return { name, config }
end
