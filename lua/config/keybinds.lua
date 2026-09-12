vim.g.mapleader = " "
vim.keymap.set("n", "<leader>/", vim.cmd.noh)
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

--LSP
local conform = require("conform")
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>gf", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Debugging
local dap = require("dap")
local dapui = require("dapui")

vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", dap.continue, {})
vim.keymap.set("n", "<leader>db", dap.run_to_cursor, {})
vim.keymap.set("n", "<F3>", dapui.toggle, {})
vim.keymap.set("n", "<F4>", dap.pause, {})
vim.keymap.set("n", "<F5>", dap.continue, {})
vim.keymap.set("n", "<F6>", dap.step_into, {})
vim.keymap.set("n", "<F7>", dap.step_over, {})
vim.keymap.set("n", "<F8>", dap.step_out, {})
vim.keymap.set("n", "<F9>", dap.step_back, {})
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor, {})
vim.keymap.set("n", "<C-F5>", dap.run_last, {})
vim.keymap.set("n", "<leader>dd", dap.disconnect, {})
vim.keymap.set("n", "<F12>", dap.terminate, {})
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

vim.keymap.set("n", "<leader>?", function()
	require("dapui").eval(nil, { enter = true })
end)
