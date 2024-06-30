return {
  'catppuccin/nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    require('catppuccin').setup {
      transparent_background = true,
      styles = {
        comments = { 'italic' },
      },
    }
    vim.cmd.colorscheme 'catppuccin-macchiato'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
}
