local M = {}

M.on_attach = function(_, bufnr)
	local keymap = vim.keymap.set
	local opts = {
		noremap = true,
		silent = false,
		buffer = bufnr,
	}

	keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap("n", "<leader>cr", require("telescope.builtin").lsp_references)
	keymap("n", "<leader>ci", require("telescope.builtin").lsp_implementations)
	keymap("n", "<leader>rr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

	keymap("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float({scope = 'line'})<CR>", opts)
	keymap("n", "<leader>kd", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "<leader>jd", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

return M
