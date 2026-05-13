local function enable_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

return {
	{ 
		"catppuccin/nvim", 
		name = "catppuccin", 
		lazy = false,
		priority = 1000, 
		config = function()
      vim.cmd([[colorscheme catppuccin-nvim]])
      enable_transparency()
		end,
	}
}
