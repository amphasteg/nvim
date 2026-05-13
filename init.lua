require("config.lazy")
require("config.keybinds")
require("config.options")
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

