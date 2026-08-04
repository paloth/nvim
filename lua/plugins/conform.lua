return {
  -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>tf',
      function()
        vim.g.format_on_save = not vim.g.format_on_save
        vim.notify('Format on save: ' .. tostring(vim.g.format_on_save), vim.log.levels.INFO)
      end,
      desc = '[T]oggle [F]ormat on save',
    },
  },
  init = function()
    -- Format on save defaults to enabled. Set before conform loads so the
    -- toggle reads a real value even on its first press.
    vim.g.format_on_save = true
  end,
  opts = {
    notify_on_error = true,
    format_on_save = function()
      if vim.g.format_on_save == false then
        return
      end
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end,
    formatters_by_ft = {
      -- NOTE: keys are filetypes, not language names. Shell scripts are `sh`,
      -- not `bash` -- with the old `bash` key shfmt never ran at all.
      sh = { 'shfmt' },
      go = { 'goimports', 'gofumpt', 'golines' },
      lua = { 'stylua' },
      -- eslint_d is a linter and cannot format JSON or YAML at all. prettier is
      -- already installed through Mason and handles all of these.
      javascript = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      markdown = { 'prettier' },
      yaml = { 'prettier' },
    },
  },
}
