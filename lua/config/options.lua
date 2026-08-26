vim.opt.number = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

vim.api.nvim_create_user_command("LintInfo", function()
  local filetype = vim.bo.filetype
  local linters = require("lint").linters_by_ft[filetype]

  if linters then
    print("Linters for " .. filetype .. ": " .. table.concat(linters, ", "))
  else
    print("No linters configured for filetype: " .. filetype)
  end
end, {})
