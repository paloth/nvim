# Plugin Configuration Guide

This document provides detailed information about each plugin in this configuration.

## Table of Contents

- [Plugin Manager](#plugin-manager)
- [LSP & Language Support](#lsp--language-support)
- [Completion](#completion)
- [Syntax & Parsing](#syntax--parsing)
- [Formatting & Linting](#formatting--linting)
- [Debugging](#debugging)
- [Search & Navigation](#search--navigation)
- [UI & Appearance](#ui--appearance)
- [Git Integration](#git-integration)
- [Utilities](#utilities)

---

## Plugin Manager

### lazy.nvim
**File:** `init.lua`
**Repository:** [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

Modern plugin manager with:
- Lazy loading (faster startup)
- Automatic plugin updates
- Lock file for reproducibility
- Performance profiling

**Commands:**
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing, update, and remove unused plugins
- `:Lazy profile` - View startup performance

**Configuration:**
- Auto-installs on first launch
- Plugins loaded from `lua/plugins/` directory
- Performance optimization enabled (disabled unused core plugins)

---

## LSP & Language Support

### nvim-lspconfig
**File:** `lua/plugins/lsp.lua`
**Repository:** [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

Quickstart configurations for Neovim's built-in LSP client.

**Configured Servers:**
- `terraformls` - Terraform
- `gopls` - Go with custom settings
- `lua_ls` - Lua with Neovim API support

**Features:**
- Auto-completion via nvim-cmp
- Document highlighting
- Reference tracking
- Inlay hints (toggleable)

### mason.nvim
**File:** `lua/plugins/lsp.lua`
**Repository:** [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

Portable package manager for LSP servers, DAP servers, linters, and formatters.

**Commands:**
- `:Mason` - Open Mason UI
- `:MasonUpdate` - Update Mason registry
- `:MasonInstall <package>` - Install package
- `:MasonUninstall <package>` - Uninstall package

**Auto-installed Tools:**
- Language servers: terraformls, gopls, lua_ls
- Formatters: stylua, goimports, gofumpt, golines, prettier, shfmt
- Linters: golangci-lint

### fidget.nvim
**File:** `lua/plugins/lsp.lua`
**Repository:** [j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)

Shows LSP progress notifications in the bottom-right corner.

**Example:** Shows "Indexing..." when gopls is indexing your Go project.

---

## Completion

### nvim-cmp
**File:** `lua/plugins/autocompletion.lua`
**Repository:** [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

Completion engine with multiple sources.

**Sources:**
- LSP completions (`cmp-nvim-lsp`)
- Snippets (`cmp_luasnip`)
- File paths (`cmp-path`)

**Keybindings (Insert Mode):**
- `<Tab>` / `<S-Tab>` - Navigate items
- `<CR>` - Confirm selection
- `<C-Space>` - Trigger completion manually

### LuaSnip
**File:** `lua/plugins/autocompletion.lua`
**Repository:** [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Snippet engine with regex and advanced features.

**Keybindings:**
- `<C-l>` - Jump to next placeholder
- `<C-h>` - Jump to previous placeholder

---

## Syntax & Parsing

### nvim-treesitter
**File:** `lua/plugins/treesitter.lua`
**Repository:** [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Modern syntax highlighting and code understanding using tree-sitter parsers.

**Installed Parsers:**
bash, c, diff, git_config, git_rebase, gitattributes, gitcommit, gitignore, go, html, json, lua, markdown, markdown_inline, nix, regex, toml, vim, vimdoc, yaml

**Features:**
- Syntax highlighting
- Smart indentation
- Incremental selection (`<C-Space>` / `<BS>`)
- Auto-install new parsers

**Commands:**
- `:TSInstall <language>` - Install parser
- `:TSUpdate` - Update all parsers
- `:TSUninstall <language>` - Remove parser
- `:TSBufToggle highlight` - Toggle highlighting

**Incremental Selection:**
1. Press `<C-Space>` in normal mode to start
2. Press `<C-Space>` again to expand selection
3. Press `<BS>` to shrink selection

---

## Formatting & Linting

### conform.nvim
**File:** `lua/plugins/conform.lua`
**Repository:** [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

Async formatter with format-on-save.

**Formatters by Language:**
- Bash: `shfmt`
- Go: `goimports` → `gofumpt` → `golines`
- JavaScript/JSON/YAML: `eslint_d`
- Lua: `stylua`
- Markdown: `prettier`

**Features:**
- Format on save (toggleable with `<leader>tf`)
- Error notifications enabled
- 500ms timeout with LSP fallback

**Commands:**
- `:ConformInfo` - Show formatter status
- `:lua vim.g.format_on_save = false` - Disable format on save

**Toggle Format on Save:**
Press `<leader>tf` to toggle. A notification will show the current state.

### nvim-lint
**File:** `lua/plugins/nvimlint.lua`
**Repository:** [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint)

Async linter that runs on buffer events.

**Linters:**
- Go: `golangci-lint`

**Auto-lint Events:**
- BufEnter (enter buffer)
- BufWritePost (after save)
- InsertLeave (exit insert mode)

**Manual Lint:**
Press `<leader>l`

---

## Debugging

### nvim-dap
**File:** `lua/plugins/debug.lua`
**Repository:** [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap)

Debug Adapter Protocol client for debugging applications.

**Keybindings:**
- `<F5>` - Continue / Start debugging
- `<F1>` - Step into
- `<F2>` - Step over
- `<F3>` - Step out
- `<F7>` - Toggle debug UI
- `<leader>b` - Toggle breakpoint
- `<leader>B` - Set conditional breakpoint

### nvim-dap-ui
**File:** `lua/plugins/debug.lua`
**Repository:** [rcarriga/nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)

UI for nvim-dap with variables, scopes, stack trace, and REPL.

### nvim-dap-go
**File:** `lua/plugins/debug.lua`
**Repository:** [leoluz/nvim-dap-go](https://github.com/leoluz/nvim-dap-go)

Go-specific debugging configuration.

**Features:**
- Auto-configured for Go debugging
- Supports `go test` debugging
- Integrated with Mason for Delve installation

---

## Search & Navigation

### telescope.nvim
**File:** `lua/plugins/telescope.lua`
**Repository:** [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)

Highly extendable fuzzy finder over lists.

**Extensions:**
- `fzf` - Native FZF sorter (fast)
- `ui-select` - Telescope UI for vim.ui.select
- `project` - Project management and switching
- `file_browser` - File browser with create/rename/delete

**Main Pickers:**
- `<leader>sf` - Find files
- `<leader>sg` - Live grep
- `<leader>sw` - Grep current word
- `<leader>sd` - Diagnostics
- `<leader>sh` - Help tags
- `<leader>sk` - Keymaps

**Project Switcher (`<leader>sp`):**
Searches for projects in:
- `~/repos/`
- `~/.config/` (max depth 2)

**File Browser:**
- `<leader>st` - Browse from current file's directory
- `<leader>sT` - Browse from current working directory

**In Browser (Normal Mode):**
- `a` - Create file/folder
- `r` - Rename
- `m` - Move
- `y` - Copy
- `d` - Delete

---

## UI & Appearance

### catppuccin
**File:** `lua/plugins/theme.lua`
**Repository:** [catppuccin/nvim](https://github.com/catppuccin/nvim)

Soothing pastel theme with 4 flavors.

**Configuration:**
- Flavour: `auto` (adapts to system theme)
- Transparent background enabled
- Custom highlights for Telescope

**Flavours:**
- `latte` - Light theme
- `frappe` - Medium theme
- `macchiato` - Dark theme
- `mocha` - Darkest theme
- `auto` - Auto-detect from system

### lualine.nvim
**File:** `lua/plugins/lualine.lua`
**Repository:** [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine)

Fast and configurable statusline.

**Theme:** Custom "bubbles" theme with distinct mode colors

**Sections:**
- Mode (color-coded)
- Filename
- Git branch
- Diff stats
- Diagnostics
- File type
- Progress
- Location

### indent-blankline.nvim
**File:** `lua/plugins/indent_line.lua`
**Repository:** [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)

Shows indent guides with scope highlighting.

### which-key.nvim
**File:** `lua/plugins/whichkey.lua`
**Repository:** [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

Displays available keybindings in a popup.

**Usage:**
Press `<Space>` and wait ~300ms to see available commands.

**Groups:**
- `<leader>b` - Buffer operations
- `<leader>c` - Code actions
- `<leader>d` - Document/diagnostics
- `<leader>g` - Git
- `<leader>r` - Rename
- `<leader>s` - Search
- `<leader>t` - Toggle
- `<leader>v` - View/windows
- `<leader>w` - Workspace

---

## Git Integration

### gitsigns.nvim
**File:** `lua/plugins/gitsigns.lua`
**Repository:** [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Git decorations in the sign column.

**Signs:**
- `+` - Added line
- `~` - Changed line
- `_` - Deleted line
- `┃` - Change in line

### lazygit.nvim
**File:** `lua/plugins/lazygit.lua`
**Repository:** [kdheepak/lazygit.nvim](https://github.com/kdheepak/lazygit.nvim)

Integration with lazygit TUI.

**Keybinding:**
`<leader>gg` - Open lazygit

**Requires:** lazygit installed (`brew install lazygit` or `pacman -S lazygit`)

---

## Utilities

### mini.nvim
**File:** `lua/plugins/mini.lua`
**Repository:** [echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim)

Collection of minimal, independent Lua modules.

**Enabled Modules:**

#### mini.indentscope
Shows visual indent scope with animated line.

#### mini.pairs
Auto-pairs brackets, quotes, and more.

**Examples:**
- Type `(` → Auto-inserts `)`
- Type `"hello"` then `<CR>` → Auto-indents

#### mini.align
Interactive text alignment.

**Usage:**
- Visual select lines
- Press `ga` and follow prompts

#### mini.ai
Enhanced text objects.

**Examples:**
- `va)` - Visual around parentheses
- `ci'` - Change inside quotes
- `yinq` - Yank inside next quote
- `dan` - Delete around next argument

#### mini.surround
Add/delete/replace surroundings.

**Keybindings:**
- `sa{motion}{char}` - Add surround
- `sd{char}` - Delete surround
- `sr{old}{new}` - Replace surround

**Examples:**
- `saiw)` - Surround word with ()
- `sd"` - Delete surrounding quotes
- `sr)]` - Replace () with []

### Comment.nvim
**File:** `lua/plugins/comment.lua`
**Repository:** [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

Smart commenting with context awareness.

**Keybindings:**
- `gcc` - Toggle line comment
- `gc{motion}` - Toggle comment (operator)
- `gbc` - Toggle block comment
- `gc` - Toggle selection (visual mode)

### vim-sleuth
**File:** `lua/plugins/sleuth.lua`
**Repository:** [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth)

Automatically detect indentation (tabs vs spaces, indent size).

Works silently in the background.

### toggleterm.nvim
**File:** `lua/plugins/terminal.lua`
**Repository:** [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

Floating terminal toggle.

**Keybinding:**
`` ` `` (backtick) - Toggle terminal

**Configuration:**
- Direction: Floating window
- Border: Curved
- Auto-change directory enabled

### todo-comments.nvim
**File:** `lua/plugins/todocomments.lua`
**Repository:** [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

Highlights TODO, FIXME, NOTE, etc. comments.

**Commands:**
- `:TodoTelescope` - Search TODOs with Telescope
- `:TodoQuickFix` - Load TODOs into quickfix

**Recognized Keywords:**
TODO, FIXME, HACK, WARN, PERF, NOTE, TEST

### snacks.nvim
**File:** `lua/plugins/snacks.lua`
**Repository:** [folke/snacks.nvim](https://github.com/folke/snacks.nvim)

Quality of life improvements.

**Enabled Features:**
- `bigfile` - Disable features for large files
- `git` - Git utilities
- `notifier` - Better notifications
- `quickfile` - Fast file operations
- `statuscolumn` - Enhanced status column
- `words` - Word highlighting

### silicon
**File:** `lua/plugins/silicon.lua`
**Repository:** [michaelrommel/nvim-silicon](https://github.com/michaelrommel/nvim-silicon)

Generate beautiful code screenshots.

**Keybindings (Visual Mode):**
- `<leader>pc` - Copy screenshot to clipboard
- `<leader>ps` - Save screenshot to file

**Configuration:**
- Font: JetBrainsMono Nerd Font
- Theme: Visual Studio Dark+
- Shadow enabled

**Requires:** silicon installed (`cargo install silicon`)

### nvim-just
**File:** `lua/plugins/just.lua`
**Repository:** [NoahTheDuke/vim-just](https://github.com/NoahTheDuke/vim-just)

Syntax highlighting for Justfiles (similar to Makefiles).

Auto-detects files named `justfile` or `Justfile`.

---

## Configuration Tips

### Disabling a Plugin

Simply delete or comment out the plugin file in `lua/plugins/`:

```bash
rm ~/.config/nvim/lua/plugins/silicon.lua
```

Or rename it:
```bash
mv lua/plugins/silicon.lua lua/plugins/silicon.lua.disabled
```

### Lazy Loading

Most plugins are already lazy-loaded via:
- `event` - Load on event (VimEnter, BufRead, etc.)
- `cmd` - Load on command
- `ft` - Load on filetype
- `keys` - Load on keypress

Example from `telescope.lua`:
```lua
{
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',  -- Lazy load on VimEnter
  -- ...
}
```

### Plugin Priority

Some plugins need to load before others:
- `theme.lua` has `priority = 1000` (loads first)
- `conform.lua` has `priority = 199`

Higher priority = loads earlier.

---

## Troubleshooting Plugins

### Plugin Not Loading

1. Check `:Lazy` for errors
2. Try `:Lazy sync` to reinstall
3. Check plugin file for syntax errors
4. View logs: `:Lazy log`

### Plugin Slowing Down Neovim

1. Profile startup: `:Lazy profile`
2. Check for non-lazy loaded plugins
3. Consider disabling unused features
4. Use `:checkhealth` to verify setup

### Plugin Conflicts

If two plugins conflict:
1. Check plugin documentation
2. Disable one temporarily
3. Check keybinding conflicts with `:Telescope keymaps`

---

## Adding New Plugins

1. Create new file in `lua/plugins/`:
```bash
touch ~/.config/nvim/lua/plugins/myplugin.lua
```

2. Add plugin spec:
```lua
return {
  'author/plugin-name',
  event = 'VeryLazy',  -- Lazy load
  opts = {
    -- Plugin options
  },
}
```

3. Restart Neovim:
```bash
nvim
```

4. Install:
```vim
:Lazy sync
```

---

## Resources

- [lazy.nvim documentation](https://github.com/folke/lazy.nvim)
- [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) - Plugin directory
- [neovimcraft](https://neovimcraft.com/) - Plugin search
- Each plugin's GitHub repository (linked above)
