local keys = {}

function keys.init()
  -- [[ Basic Keymaps ]]
  --  See `:help vim.keymap.set()`
  vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- TIP: Disable arrow keys in normal mode
  vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
  vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  -- Split screen
  vim.keymap.set('n', '<leader>vv', '<CMD>:vsplit<CR>', { desc = 'Vertical Split view' })
  vim.keymap.set('n', '<leader>vh', '<CMD>:split<CR>', { desc = 'Horizontal Split view' })
  vim.keymap.set('n', '<leader>vd', '<C-w>q', { desc = 'Close current view' })

  -- Move lines
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line up', silent = true })
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line down', silent = true })
end

return keys
