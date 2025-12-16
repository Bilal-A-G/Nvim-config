-- lazy.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	config = function()
		local ok, noice = pcall(require, "noice")
		if not ok then
			return
		end
		local noice_hl = vim.api.nvim_create_augroup("NoiceHighlights", {})
		local noice_cmd_types = {
			"CmdLine",
			"Lua",
			"Filter",
			"Rename",
		}
		vim.api.nvim_clear_autocmds({ group = noice_hl })
		vim.api.nvim_create_autocmd("BufEnter", {
			group = noice_hl,
			callback = function()
				for _, type in ipairs(noice_cmd_types) do
					vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder" .. type, {})
					vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder" .. type, { link = "Constant" })
				end
			end,
		})
		noice.setup({
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
			},
		})
	end,
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
