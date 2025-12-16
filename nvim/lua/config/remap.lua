vim.g.mapleader = " "
vim.keymap.set("n", "<leader>dd", vim.cmd.Ex, { desc = "File Explorer: Opens file explorer" })
vim.keymap.set("n", "<ESC>", ":nohl<CR>", { silent = true })
