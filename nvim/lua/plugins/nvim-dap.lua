return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup({
			expand_lines = true,
			controls = { enabled = false },
			floating = { border = "rounded" },
			render = {
				max_type_length = 60,
				max_value_lines = 200,
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 1.0 },
					},
					size = 10,
					position = "bottom",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		vim.fn.sign_define("DapBreakpoint", {
			text = "󰋙",
			texthl = "DapBreakpointSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapStopped", {
			text = "󰫈",
			texthl = "yellow",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.fn.sign_define("DapBreakpointRejected", {
			text = "󰫃",
			texthl = "DapStoppedSymbol",
			linehl = "DapBreakpoint",
			numhl = "DapBreakpoint",
		})

		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dc", dap.continue)
		vim.keymap.set("n", "<leader>n", dap.step_over)

		vim.keymap.set("n", "<leader>de", function()
			dap.terminate()
			dapui.toggle()
		end, { noremap = true, silent = true })
	end,
}
