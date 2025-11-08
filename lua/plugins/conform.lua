return {
  -- Autoformat
  'stevearc/conform.nvim',
  priority = 199,
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Check global toggle (default enabled)
      if vim.g.format_on_save == false then
        return
      end
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end,
    formatters_by_ft = {
      bash = { 'shfmt' },
      go = { 'goimports', 'gofumpt', 'golines' },
      javascript = { 'eslint_d' },
      json = { 'eslint_d' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      yaml = { 'eslint_d' },
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)

    -- Initialize format on save as enabled by default
    vim.g.format_on_save = true

    -- Add toggle keybind
    vim.keymap.set('n', '<leader>tf', function()
      vim.g.format_on_save = not vim.g.format_on_save
      vim.notify('Format on save: ' .. tostring(vim.g.format_on_save), vim.log.levels.INFO)
    end, { desc = '[T]oggle [F]ormat on save' })
  end,
}
