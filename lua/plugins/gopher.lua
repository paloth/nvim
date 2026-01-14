return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  -- branch = "develop", -- if you want latest features
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('gopher').setup {
      commands = {
        go = 'go',
        gomodifytags = 'gomodifytags',
        gotests = 'gotests',
        impl = 'impl',
        iferr = 'iferr',
      },
    }
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
