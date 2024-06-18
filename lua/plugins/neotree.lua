return {
  'nvim-neo-tree/neo-tree.nvim',
  tag = '3.14',
  lazy = false,
  keys = {
    { '<leader>t', '<cmd>Neotree toggle reveal position=float<cr>', desc = 'Toggle Neotree' },
  },
  opts = {
    filesystem = {
      follow_current_file = {
        enabled = false,
        leave_dirs_open = false,
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
}
