vim.g.mapleader = " "
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<C-n>", ':Neotree filesystem reveal left<CR>')

--LSP
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
