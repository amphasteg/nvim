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
            mantle = "#171717",
            crust = "#171717",
            base = "#1A1A1A",
          },
        }
      })
			vim.cmd([[colorscheme catppuccin-nvim]])
		end,
	},
}
