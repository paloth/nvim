return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Neovim 0.11+ already ships grn (rename), gra (code action), grr
        -- (references), gri (implementation), grt (type definition), gO
        -- (document symbols) and K (hover). We only override the ones where a
        -- Telescope picker beats the built-in quickfix UI, so there is exactly
        -- one keybind per action instead of a native/<leader> pair.
        local builtin = require 'telescope.builtin'
        map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
        map('grr', builtin.lsp_references, '[G]oto [R]eferences')
        map('gri', builtin.lsp_implementations, '[G]oto [I]mplementation')
        map('grt', builtin.lsp_type_definitions, '[G]oto [T]ype definition')
        map('gO', builtin.lsp_document_symbols, 'Document Symbols')
        map('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- NOTE: reference highlighting under the cursor is handled by
        -- snacks.nvim's `words` module, which also adds ]] / [[ navigation.

        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Enable inlay hints if supported
        if client and client:supports_method 'textDocument/inlayHint' then
          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }, { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP Specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    vim.lsp.config('*', {
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    -- Per-server overrides, merged on top of the `lsp/<name>.lua` definitions
    -- that nvim-lspconfig ships (which provide cmd, filetypes and root markers).
    local servers = {
      gopls = {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              shadow = true,
              unusedwrite = true,
              fieldalignment = true,
              nilness = true,
              useany = true,
            },
            staticcheck = true,
            gofumpt = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
          },
        },
      },

      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded
              -- for your neovim configuration.
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    for name, config in pairs(servers) do
      vim.lsp.config(name, config)
    end

    -- Servers we want running, whether or not they carry an override above.
    --
    -- Their binaries come from Nix (darwin/home-manager/neovim.nix). mason.nvim
    -- used to install them and failed silently: bashls, jsonls and yamlls were
    -- listed here with nothing on disk to run.
    local enabled_servers = {
      'bashls',
      'gopls',
      'helm_ls',
      'jsonls',
      'lua_ls',
      'terraformls',
      'yamlls',
    }

    vim.lsp.enable(enabled_servers)
  end,
}
