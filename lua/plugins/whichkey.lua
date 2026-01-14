return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      {
        { '<leader>b', group = '[B]uffer' },
        { '<leader>b_', hidden = true },
        { '<leader>c', group = '[C]ode' },
        { '<leader>ca', desc = '[C]ode [A]ction' },
        { '<leader>c_', hidden = true },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>d_', hidden = true },
        { '<leader>g', group = '[G]it' },
        { '<leader>g_', hidden = true },
        { '<leader>go', group = '[G]o' },
        { '<leader>goa', desc = '[G]o [A]dd tags' },
        { '<leader>gor', desc = '[G]o [R]emove tags' },
        { '<leader>goi', desc = '[G]o [I]mplement interface' },
        { '<leader>l', desc = '[L]int file' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>r_', hidden = true },
        { '<leader>s', group = '[S]earch' },
        { '<leader>s_', hidden = true },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>th', desc = '[T]oggle Inlay [H]ints' },
        { '<leader>t_', hidden = true },
        { '<leader>v', group = '[V]iew' },
        { '<leader>v_', hidden = true },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>w_', hidden = true },
      },
    }
  end,
}
