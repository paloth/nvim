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
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }

    -- Single source of truth: filetype -> parser name.
    --
    -- NOTE: the parser name is load-bearing. `vim.treesitter.start()` resolves a
    -- buffer's language from its filetype, so any pair that differs has to be
    -- registered below -- otherwise the entry is inert. That is what previously
    -- left `terraform` (which needs the `hcl` parser) with no highlighting.
    local ft_to_parser = {
      bash = 'bash',
      c = 'c',
      diff = 'diff',
      dockerfile = 'dockerfile',
      gitattributes = 'gitattributes',
      gitcommit = 'gitcommit',
      gitconfig = 'git_config',
      gitignore = 'gitignore',
      gitrebase = 'git_rebase',
      go = 'go',
      gomod = 'gomod',
      gotmpl = 'gotmpl',
      gowork = 'gowork',
      helm = 'gotmpl',
      help = 'vimdoc',
      html = 'html',
      json = 'json',
      lua = 'lua',
      markdown = 'markdown',
      nix = 'nix',
      terraform = 'hcl',
      toml = 'toml',
      vim = 'vim',
      yaml = 'yaml',
    }

    -- Parsers used only through injections, so they have no filetype of their own.
    local injected_parsers = { 'markdown_inline', 'regex' }

    local parsers = {}
    local seen = {}
    for ft, lang in pairs(ft_to_parser) do
      if ft ~= lang then
        vim.treesitter.language.register(lang, ft)
      end
      if not seen[lang] then
        seen[lang] = true
        table.insert(parsers, lang)
      end
    end
    for _, lang in ipairs(injected_parsers) do
      table.insert(parsers, lang)
    end

    -- Install parsers (no-op if already installed)
    require('nvim-treesitter').install(parsers)

    -- Enable treesitter highlighting and indentation for all of the above.
    -- Neovim 0.12 enables markdown highlighting by default; this covers the rest.
    vim.api.nvim_create_autocmd('FileType', {
      pattern = vim.tbl_keys(ft_to_parser),
      callback = function(args)
        -- Enable treesitter highlighting
        pcall(vim.treesitter.start, args.buf)
        -- Enable treesitter indentation
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
