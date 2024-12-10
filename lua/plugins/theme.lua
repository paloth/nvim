return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    vim.cmd.colorscheme 'onedark_vivid'

    -- You can configure highlights by doing something like
    vim.cmd.hi 'Comment gui=none'
  end,
  config = function()
    require('onedarkpro').setup {
      styles = { -- For example, to apply bold and italic, use "bold,italic"
        types = 'italic', -- Style that is applied to types
        methods = 'NONE', -- Style that is applied to methods
        numbers = 'NONE', -- Style that is applied to numbers
        strings = 'NONE', -- Style that is applied to strings
        comments = 'italic', -- Style that is applied to comments
        keywords = 'bold,italic', -- Style that is applied to keywords
        constants = 'bold', -- Style that is applied to constants
        functions = 'bold,italic', -- Style that is applied to functions
        operators = 'NONE', -- Style that is applied to operators
        variables = 'NONE', -- Style that is applied to variables
        parameters = 'NONE', -- Style that is applied to parameters
        conditionals = 'italic', -- Style that is applied to conditionals
        virtual_text = 'NONE', -- Style that is applied to virtual text
      },
      plugins = { -- Override which plugin highlight groups are loaded
        telescope = false,
        toggleterm = false,
        treesitter = true,
      },
    }
  end,
}
