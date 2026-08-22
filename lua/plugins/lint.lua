return {
	"mfussenegger/nvim-lint",
	event = {
	},
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			markdown = { "markdownlint" },
			quarto = { "markdownlint" },
      lua = { "luacheck" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
