return {
  'michaelrommel/nvim-silicon',
  lazy = true,
  cmd = 'Silicon',
  main = 'nvim-silicon',
  -- NOTE: uses <leader>P, not <leader>p -- the lowercase one is visual-mode
  -- "paste without yanking" (see lua/keys.lua).
  --
  -- These live in a lazy `keys` spec rather than `init`, because `init` runs at
  -- startup and its `require 'which-key'` force-loaded which-key eagerly,
  -- defeating which-key's own VimEnter lazy trigger.
  keys = {
    {
      '<leader>Pc',
      function()
        require('nvim-silicon').clip()
      end,
      mode = { 'v' },
      desc = '[P]rint [C]opy screenshot (to clipboard)',
    },
    {
      '<leader>Ps',
      function()
        require('nvim-silicon').file()
      end,
      mode = { 'v' },
      desc = '[P]rint [S]ave screenshot (to file)',
    },
  },
  opts = {
    font = 'JetBrainsMono Nerd Font=28',
    theme = 'Visual Studio Dark+',
    background = '#ffffff',
    no_window_controls = true,
    to_clipboard = true,
  },
}
