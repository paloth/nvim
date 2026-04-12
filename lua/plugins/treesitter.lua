return {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    require('nvim-treesitter').setup {
      -- Directory to install parsers and queries to
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    -- Install parsers (no-op if already installed)
    local parsers = {
      'bash',
      'c',
      'diff',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitcommit',
      'gitignore',
      'go',
      'html',
      'json',
      'lua',
      'markdown',
      'markdown_inline',
      'nix',
      'regex',
      'toml',
      'vim',
      'vimdoc',
      'yaml',
    }
    require('nvim-treesitter').install(parsers)

    -- Enable treesitter highlighting and indentation for all installed parsers.
    -- Neovim 0.12 enables markdown highlighting by default; this covers the rest.
    local ft_to_lang = {
      bash = 'bash',
      c = 'c',
      diff = 'diff',
      gitconfig = 'git_config',
      gitrebase = 'git_rebase',
      gitattributes = 'gitattributes',
      gitcommit = 'gitcommit',
      gitignore = 'gitignore',
      go = 'go',
      gomod = 'go',
      gowork = 'go',
      gotmpl = 'go',
      html = 'html',
      json = 'json',
      lua = 'lua',
      markdown = 'markdown',
      nix = 'nix',
      toml = 'toml',
      vim = 'vim',
      help = 'vimdoc',
      yaml = 'yaml',
      terraform = 'hcl',
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = vim.tbl_keys(ft_to_lang),
      callback = function(args)
        -- Enable treesitter highlighting
        pcall(vim.treesitter.start, args.buf)
        -- Enable treesitter indentation
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
