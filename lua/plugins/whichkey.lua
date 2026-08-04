return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function(_, opts)
    require('which-key').setup(opts)

    -- Document existing key chains. Groups only -- individual descriptions come
    -- from the `desc` on each keymap, so repeating them here just risks drift.
    require('which-key').add {
      { '<leader>b', group = '[B]uffer' },
      { '<leader>b_', hidden = true },
      { '<leader>d', group = '[D]ebug' },
      { '<leader>d_', hidden = true },
      { '<leader>g', group = '[G]it' },
      { '<leader>g_', hidden = true },
      { '<leader>go', group = '[G]o' },
      { '<leader>P', group = 'Silicon ([P]rint)', mode = { 'v' } },
      { '<leader>s', group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>t_', hidden = true },
      { '<leader>v', group = '[V]iew' },
      { '<leader>v_', hidden = true },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>w_', hidden = true },
    }
  end,
}
