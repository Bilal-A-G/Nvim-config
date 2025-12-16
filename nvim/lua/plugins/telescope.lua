return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/todo-comments.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find files" },
		{
			"<leader>pf",
			"<cmd>Telescope git_files<cr>",
			desc = "Telescope: Find files in git repo (ONLY USE ON GIT REPOS)",
		},
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Telescope: Find files that contain string" },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Telescope: Find todo comments" },
	},
	opts = {
		pickers = {
			find_files = {
				disable_devicons = true,
			},
		},
	},
}
