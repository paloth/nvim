return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  main = 'nvim-silicon',
  init = function()
    local wk = require 'which-key'
    wk.add {
      mode = { 'v' },
      { 'n', '<leader>p', group = 'Silicon' },
      {
        '<leader>pc',
        function()
          require('nvim-silicon').clip()
        end,
        desc = '[P]rint [C]opy screenshot (to clipboard)',
      },
      {
        '<leader>ps',
        function()
          require('nvim-silicon').file()
        end,
        desc = '[P]rint [S]ave screenshot (to file)',
      },
    }
  end,
  opts = {
    font = 'JetBrainsMono Nerd Font=28',
    theme = 'Visual Studio Dark+',
    background = '#ffffff',
    no_window_controls = true,
    to_clipboard = true,
  },
}
