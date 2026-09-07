return {
	{
		"stevearc/overseer.nvim",
		---@module 'overseer'
		---@type overseer.SetupOpts
		opts = {},
    config = function()
      require("overseer").setup()
    end,

      
	},
}
