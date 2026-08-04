return {
  -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    require('mini.pairs').setup()
    require('mini.align').setup()

    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- Note: mini.statusline removed as we're using lualine instead
    -- Note: mini.indentscope removed -- indent-blankline already draws indent
    -- guides, and running both stacked two sets of guides on the same lines.

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
