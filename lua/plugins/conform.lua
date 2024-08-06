return {
  -- Autoformat
  'stevearc/conform.nvim',
  priority = 199,
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      go = { 'goimports', 'gofumpt', 'golines' },
      json = { 'prettier' },
      lua = { 'stylua' },
      markdown = { 'prettier' },
      yaml = { 'prettier' },
    },
  },
}
