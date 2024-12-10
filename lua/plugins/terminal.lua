-- return {
--   'numToStr/FTerm.nvim',
--   enabled = true,
--   commit = 'd1320892cc2ebab472935242d9d992a2c9570180',
--   main = 'FTerm',
--   keys = {
--     { '`', '<CMD>lua require("FTerm").toggle()<CR>', desc = 'Open terminal' },
--     { '`', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', mode = 't', desc = 'Close terminal' },
--   },
-- }
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
