return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>l',
      function()
        require('lint').try_lint()
      end,
      desc = '[L]int file',
    },
  },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      go = { 'golangcilint' },
    }

    -- Customize golangcilint if needed
    -- lint.linters.golangcilint.args = {
    --   'run',
    --   '--out-format',
    --   'json',
    --   '--show-stats=false',
    --   '--print-issued-lines=false',
    --   '--print-linter-name=false',
    -- }

    -- NOTE: deliberately not on BufEnter. golangci-lint analyses the whole
    -- package, so linting on every buffer switch spawned a slow process each
    -- time you moved between windows. Writes and leaving insert are enough.
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
