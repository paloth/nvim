return {
  'catppuccin/nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  config = function()
    require('catppuccin').setup {
      flavour = 'auto', -- latte, frappe, macchiato, mocha
      transparent_background = true,
      highlight_overrides = {
        all = function(colors)
          return {
            NormalFloat = { bg = colors.none },
            TelescopeBorder = { bg = colors.none },
          }
        end,
      },
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        booleans = {},
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        functions = { 'bold', 'italic' },
        keywords = { 'bold' },
        loops = { 'italic' },
        numbers = {},
        operators = {},
        properties = {},
        strings = {},
        types = { 'italic' },
        variables = { 'bold', 'italic' },
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
    }
  end,
}
