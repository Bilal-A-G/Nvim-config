require("config.lazy")
require("config.remap")
require("config.autocmds")
require("utils.debugger")

vim.o.background = "dark"
vim.cmd([[colorscheme zenbones]])
vim.wo.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.showmode = false

vim.cmd([[set cmdheight=0]])

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

local function make_hl_bg_transparent(name)
	local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
	if hl then
		hl.bg = "NONE"
		vim.api.nvim_set_hl(0, name, hl)
	end
end

-- Apply it to sign highlight groups
local sign_hls = {
	"DiagnosticSignError",
	"DiagnosticSignWarn",
	"DiagnosticSignInfo",
	"DiagnosticSignHint",
}

for _, group in ipairs(sign_hls) do
	make_hl_bg_transparent(group)
end
