return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function ()
		local treesitter = require("nvim-treesitter.configs");
		treesitter.setup ({
			sync_install = true,
			ensure_installed = {
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"cpp",
				"bash",
				"gitignore",
				"html",
				"css",
				"python"
			},
			highlight = {
				enable = true
			},
			indent = {
				enable = true
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<CR>',
					scope_incremental = '<CR>',
					node_incremental = '<TAB>',
					node_decremental = '<S-TAB>',
				},
			}
		})
	end,
}
