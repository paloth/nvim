return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  main = 'nvim-silicon',
  init = function()
    local wk = require 'which-key'
    wk.register({
      ['p'] = {
        name = 'Silicon',
        ['s'] = {
          function()
            require('nvim-silicon').file()
          end,
          '[P]rint [S]ave screenshot (to file)',
        },
        ['c'] = {
          function()
            require('nvim-silicon').clip()
          end,
          '[P]rint [C]opy screenshot (to clipboard)',
        },
      },
    }, { prefix = '<leader>', mode = 'v' })
  end,
  opts = {
    font = 'JetBrainsMono Nerd Font=28',
    theme = 'Visual Studio Dark+',
    background = '#ffffff',
    no_window_controls = true,
    to_clipboard = true,
  },
}
