return {
	"https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
	opts = {
		server = {
			cmd = {
				"sonarlint-language-server",
				-- Ensure that sonarlint-language-server uses stdio channel
				"-stdio",
				"-analyzers",
				--TODO: Make these rel paths, this way of doing things is very fragile
				"/home/Bilal/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarjava.jar",
				"/home/Bilal/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarcfamily.jar",
				"/home/Bilal/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarpython.jar",
			},
		},
		filetypes = {
			-- Tested and working
			"cs",
			"dockerfile",
			"python",
			"cpp",
			"java",
		},
	},
}
