return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		{
			"jay-babu/mason-nvim-dap.nvim",
			config = function()
				require("mason-nvim-dap").setup({
				})
			end,
		},
		{
			"mfussenegger/nvim-jdtls",
			dependencies = {
				"mfussenegger/nvim-dap",
			},
		},
		{
			"creativenull/efmls-configs-nvim",
		},
	},
	config = function()
		require("utils.diagnostics").setup()
		require("servers")
	end,
}
