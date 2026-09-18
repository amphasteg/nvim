return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
      require("catppuccin").setup({
        auto_integrations = true,
        color_overrides = {
          all = {
            mantle = "#030303",
            crust = "#030303",
            base = "#000000",
          },
        }
      })
			vim.cmd([[colorscheme catppuccin-nvim]])
		end,
	},
}
