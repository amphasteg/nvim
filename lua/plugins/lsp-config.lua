local lsps = {
	"lua_ls",
	"rust_analyzer",
	"codebook",
	"clangd",
	"stylua",
	"tsserver",
	"html",
	"eslint",
	"tsserver",
	"roslyn-language-server",
}

return {
	"mason-org/mason-lspconfig.nvim",
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		for i, v in ipairs(lsps) do
			vim.lsp.config(v, { capabilities = capabilities })
			vim.lsp.enable(v)
			vim.diagnostic.config({ virtual_text = true, update_in_insert = true })
		end

		vim.lsp.config("codebook", {})
	end,

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "neovim/nvim-lspconfig", lazy = false },
	},
	opts = {
		ensure_installed = { lsps },
	},
}
