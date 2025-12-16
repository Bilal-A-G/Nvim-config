--local capabilities = require("cmp_nvim_lsp").default_capabilities
local on_attach = require("utils.lsp").on_attach

local lsps = {
	require("servers.lua_ls")(on_attach),
	require("servers.python_ls")(on_attach),
	require("servers.ts_ls")(on_attach),
	require("servers.css_ls")(on_attach),
	require("servers.bash_ls")(on_attach),
	require("servers.cpp_ls")(on_attach),
	require("servers.cmake_ls")(on_attach),
	require("servers.glsl_ls")(on_attach),
	require("servers.go_ls")(on_attach),
	require("servers.efm-langserver")(on_attach),
	require("servers.rust_ls")(on_attach),
}

for _, lsp in pairs(lsps) do
	local name, config = lsp[1], lsp[2]
	vim.lsp.enable(name)
	if config then
		vim.lsp.config(name, config)
	end
end
