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
        width = 250,
        height = 55,
        title_pos = 'center',
      },
    },
  },
}
