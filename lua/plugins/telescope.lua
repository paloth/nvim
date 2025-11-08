return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-project.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    local fb_actions = require 'telescope._extensions.file_browser.actions'

    require('telescope').setup {
      -- pickers = {},
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
        file_browser = {
          theme = 'ivy',
          hijack_netrw = true,
          initial_mode = 'normal',
          hidden = {
            file_browser = true,
            folder_browser = true,
          },
          mappings = {
            ['n'] = {
              ['a'] = fb_actions.create,
              ['r'] = fb_actions.rename,
              ['m'] = fb_actions.move,
              ['y'] = fb_actions.copy,
              ['d'] = fb_actions.remove,
            },
          },
        },
        project = {
          base_dirs = {
            '~/repos/',
            {
              '~/.config/',
              max_depth = 2,
            },
          },
          hidden_files = true,
          display_type = 'full',
          theme = 'dropdown',
          order_by = 'desc',
          search_by = 'title',
          sync_with_nvim_tree = true,
          -- default for on_project_selected = find project files
          on_project_selected = function(prompt_bufnr)
            local project_actions = require 'telescope._extensions.project.actions'
            project_actions.change_working_directory(prompt_bufnr, false)
          end,
        },
      },
    }

    -- Enable telescope extensions, if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'project')
    pcall(require('telescope').load_extension, 'file_browser')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>st', '<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[S]earch [T]ree' })
    vim.keymap.set('n', '<leader>sT', '<CMD>Telescope file_browser<CR>', { desc = '[S]earch [T]ree (cwd)' })
    vim.keymap.set('n', '<leader>sp', '<CMD>Telescope project<CR>', { desc = '[S]earch [P]roject' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[F]ind existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- Also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })

    -- Shortcut for searching your neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })
  end,
}
