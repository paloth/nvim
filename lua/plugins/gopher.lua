return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  -- branch = "develop", -- if you want latest features
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  -- gomodifytags, gotests, impl and iferr come from Nix
  -- (darwin/home-manager/neovim.nix). The `build = GoInstallDeps` hook that
  -- used to `go install` them wrote into ~/go/bin, which was not on PATH, so
  -- :GoTests and :GoIfErr failed.
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
}
