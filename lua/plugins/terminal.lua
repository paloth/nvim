return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    -- `config = true` was redundant: supplying `opts` already makes lazy.nvim
    -- call setup() with it.
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = { { [[`]], desc = 'Toggle terminal', mode = { 'n', 't' } } },
    opts = {
      open_mapping = [[`]],
      direction = 'float',
      autochdir = true,
      float_opts = {
        border = 'curved',
        title_pos = 'center',
      },
    },
  },
}
