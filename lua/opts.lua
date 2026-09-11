local opts = {}

function opts.init()
  -- [[ Setting options ]]
  -- See `:help vim.opt`
  -- NOTE: You can change these options as you wish!
  --  For more options, you can see `:help option-list`
  vim.opt.number = true -- Make line numbers default
  vim.opt.relativenumber = true -- Enable relative line numbers
  vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
  vim.opt.showmode = false -- Don't show the mode, since it's already in status line
  vim.opt.cmdheight = 0 -- Hide command line (using noice.nvim)
  vim.opt.laststatus = 3 -- Global statusline
  vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
  vim.opt.breakindent = true -- Enable break indent
  vim.opt.undofile = true -- Save undo history
  vim.opt.hlsearch = true -- Set highlight on search, but clear on pressing <Esc> in normal mode
  -- Case-insensitive searching UNLESS \C or capital in search
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
  -- Decrease update time
  vim.opt.updatetime = 250
  vim.opt.timeoutlen = 300
  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  -- Sets how neovim will display certain whitespace in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  vim.opt.list = true
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
  vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
  vim.opt.cursorline = true -- Show which line your cursor is on
  vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor.
  -- Enable true color support
  vim.opt.termguicolors = true
  -- Default border for every floating window (hover, diagnostics, LSP), so each
  -- plugin no longer needs its own border option. Nvim 0.11+.
  vim.opt.winborder = 'rounded'
  -- Disable swap and backup files
  vim.opt.swapfile = false
  vim.opt.backup = false
  vim.opt.writebackup = false
  -- Session options
  vim.opt.sessionoptions = 'buffers,curdir,tabpages,winsize,help,globals,skiprtp'
end

return opts
