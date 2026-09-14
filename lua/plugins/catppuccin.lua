return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme catppuccin-nvim]])
      require("catppuccin").setup({
        auto_integrations = true
      })
		end,
	},
}
