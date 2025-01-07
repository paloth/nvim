return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = true,
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
