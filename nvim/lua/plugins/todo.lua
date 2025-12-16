return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")
		local keymap = vim.keymap
		keymap.set("n", "<leader>jt", function()
			todo_comments.jump_next()
		end)
		keymap.set("n", "<leader>kt", function()
			todo_comments.jump_prev()
		end)
		todo_comments.setup({
			signs = false,
			highlight = {
				comments_only = true,
				multiline = true,
				before = "fg",
				after = "fg",
				keyword = "wide",
				pattern = [[.*<(KEYWORDS)\s*:]],
			},
			keywords = {
				BUG = { icon = " ", color = "error" },
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			},
			colors = {
				error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
				warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
				info = { "DiagnosticInfo", "#2563EB" },
				hint = { "DiagnosticHint", "#10B981" },
				default = { "Identifier", "#7C3AED" },
				test = { "Identifier", "#FF00FF" },
			},
			gui_style = {
				fg = "NONE",
				bg = "BOLD",
			},
		})
	end,
}
