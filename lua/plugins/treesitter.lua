return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site' 
    }

    require('nvim-treesitter').install 
    {
      'lua',
      'rust',
      'cpp',
      'c',
      'c_sharp',
      'python',
      'svelte',
      'css',
      'html',
      'tsx',
      'java',
      'markdown',
      'xml',
      'sql'
    }

    require'nvim-treesitter.config'.setup {
      highlight = { enable = true },
      indent = { enable = true },
      autotage = { enable = true },
      auto_install = true,
    }
    
end
}
