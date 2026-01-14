return {
  'folke/noice.nvim',
  event = 'VimEnter',
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        background_colour = '#121212',
      },
    },
  },
  opts = {
    views = {
      cmdline_popup = {
        position = { row = '50%', col = '50%' },
        size = { width = 60, height = 'auto' },
        border = { style = 'rounded', padding = { 0, 1 } },
        win_options = {
          winhighlight = { Normal = 'NormalFloat', FloatBorder = 'TelescopeBorder' },
          winblend = 10,
        },
      },
      popupmenu = {
        relative = 'editor',
        position = { row = '54%', col = '50%' },
        size = { width = 60, height = 10 },
        border = { style = 'rounded', padding = { 0, 1 } },
        win_options = {
          winhighlight = { Normal = 'NormalFloat', FloatBorder = 'TelescopeBorder' },
          winblend = 10,
        },
      },
    },
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
    },
    routes = {
      { filter = { event = 'msg_show', find = 'written' }, opts = { skip = true } },
    },
    presets = {
      long_message_to_split = true,
    },
  },
  keys = {
    { '<leader>snd', function() require('noice').cmd 'dismiss' end, desc = 'Dismiss All' },
    { '<c-f>', function() if not require('noice.lsp').scroll(4) then return '<c-f>' end end, silent = true, expr = true, desc = 'Scroll Forward', mode = { 'i', 'n', 's' } },
    { '<c-b>', function() if not require('noice.lsp').scroll(-4) then return '<c-b>' end end, silent = true, expr = true, desc = 'Scroll Backward', mode = { 'i', 'n', 's' } },
  },
}
