# Personal Neovim Configuration

A modern, well-organized Neovim configuration based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) with extensive enhancements for a complete development experience.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration Overview](#configuration-overview)
- [Keybindings Reference](#keybindings-reference)
- [Plugin List](#plugin-list)
- [LSP Configuration](#lsp-configuration)
- [Customization](#customization)
- [Health Check](#health-check)
- [Troubleshooting](#troubleshooting)

---

## Features

### Core Enhancements
- ✅ **Modern UI**: Catppuccin theme with transparency, lualine status bar
- ✅ **LSP Integration**: Full Language Server Protocol support with Mason
- ✅ **Smart Completion**: nvim-cmp with snippets and LSP integration
- ✅ **Fuzzy Finding**: Telescope with file browser, project switcher, and live grep
- ✅ **Syntax Highlighting**: Treesitter with 20+ language parsers
- ✅ **Code Formatting**: Auto-format on save with toggleable conform.nvim
- ✅ **Linting**: Real-time code linting with nvim-lint
- ✅ **Debugging**: Full DAP integration with UI for Go and more
- ✅ **Git Integration**: Gitsigns, LazyGit, and git-aware features
- ✅ **Terminal**: Floating terminal with toggleterm
- ✅ **Smart Navigation**: Buffer, quickfix, and diagnostic navigation

### Recent Improvements
- 🎨 **True Color Support**: `termguicolors` enabled
- 📊 **Relative Line Numbers**: Better for vim motions
- 💡 **LSP Inlay Hints**: With `<leader>th` toggle
- ⚡ **Performance Optimized**: Lazy.nvim with disabled unused plugins
- 🔄 **Format Toggle**: `<leader>tf` to toggle format-on-save
- 📁 **Session Management**: Enhanced session options
- 🪟 **Window Bar**: Shows file path in window statusline
- 🔍 **Incremental Selection**: Treesitter selection with Ctrl-Space
- 🎯 **Extended Keybindings**: Buffer, quickfix, and text manipulation

---

## Requirements

### Essential
- **Neovim** >= 0.9.4 (0.10+ recommended)
- **Git** - For plugin management and git features
- **A Nerd Font** - For icons (recommended: JetBrainsMono Nerd Font)
- **ripgrep (rg)** - For Telescope live grep
- **make** - For building telescope-fzf-native

### Optional but Recommended
- **fd** - Faster file finding for Telescope
- **lazygit** - TUI for git operations
- **prettier** - JavaScript/JSON/YAML/Markdown formatting
- **stylua** - Lua code formatting
- **goimports** - Go import management
- **gofumpt** - Stricter Go formatting
- **golines** - Go line length formatting
- **golangci-lint** - Go linting
- **shfmt** - Bash formatting

---

## Installation

### 1. Backup Existing Configuration
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

### 2. Clone This Repository
```bash
git clone <your-repo-url> ~/.config/nvim
```

### 3. Install Neovim
```bash
# macOS
brew install neovim

# Ubuntu/Debian
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# Arch Linux
sudo pacman -S neovim
```

### 4. Install a Nerd Font
Download and install a [Nerd Font](https://www.nerdfonts.com/) (e.g., JetBrainsMono Nerd Font)

### 5. First Launch
```bash
nvim
```

On first launch:
- Lazy.nvim will auto-install
- Plugins will be installed automatically
- LSP servers will be installed via Mason
- Treesitter parsers will be installed

### 6. Verify Installation
```vim
:checkhealth
```

---

## Configuration Overview

### File Structure
```
~/.config/nvim/
├── init.lua                      # Entry point, plugin manager setup
├── lua/
│   ├── opts.lua                  # Vim options and settings
│   ├── keys.lua                  # Core keybindings
│   ├── filetypes.lua            # Custom filetype associations
│   ├── plugins/                  # Plugin configurations
│   │   ├── init.lua             # Plugin loader
│   │   ├── lsp.lua              # LSP configuration
│   │   ├── autocompletion.lua   # Completion engine
│   │   ├── treesitter.lua       # Syntax highlighting
│   │   ├── telescope.lua        # Fuzzy finder
│   │   ├── conform.lua          # Code formatting
│   │   ├── nvimlint.lua         # Linting
│   │   ├── debug.lua            # DAP debugging
│   │   ├── theme.lua            # Color scheme
│   │   ├── lualine.lua          # Status line
│   │   ├── whichkey.lua         # Keybinding hints
│   │   ├── gitsigns.lua         # Git signs
│   │   ├── lazygit.lua          # Git UI
│   │   ├── terminal.lua         # Terminal integration
│   │   ├── comment.lua          # Comment toggling
│   │   ├── mini.lua             # Mini plugins collection
│   │   ├── snacks.nvim          # Utility features
│   │   ├── indent_line.lua      # Indent guides
│   │   ├── sleuth.lua           # Auto indentation detection
│   │   ├── todocomments.lua     # TODO highlighting
│   │   ├── silicon.lua          # Code screenshots
│   │   └── just.lua             # Justfile support
│   └── kickstart/
│       └── health.lua           # Health check utilities
└── README.md                     # This file
```

### Core Settings (lua/opts.lua)

| Setting | Value | Description |
|---------|-------|-------------|
| `leader` | `<Space>` | Leader key for custom commands |
| `number` | `true` | Show line numbers |
| `relativenumber` | `true` | Relative line numbers for motions |
| `mouse` | `'a'` | Enable mouse support |
| `clipboard` | `'unnamedplus'` | Sync with system clipboard |
| `undofile` | `true` | Persistent undo history |
| `ignorecase` | `true` | Case-insensitive search |
| `smartcase` | `true` | Case-sensitive if uppercase present |
| `signcolumn` | `'yes'` | Always show sign column |
| `updatetime` | `250` | Faster completion (ms) |
| `timeoutlen` | `300` | Key sequence timeout (ms) |
| `splitright` | `true` | Vertical splits go right |
| `splitbelow` | `true` | Horizontal splits go below |
| `scrolloff` | `10` | Lines to keep above/below cursor |
| `termguicolors` | `true` | True color support |
| `swapfile` | `false` | Disable swap files |
| `backup` | `false` | Disable backup files |

---

## Keybindings Reference

### General

| Key | Mode | Action |
|-----|------|--------|
| `<Space>` | Normal | Leader key |
| `<Esc>` | Normal | Clear search highlight |

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to lower window |
| `<C-k>` | Normal | Move to upper window |
| `<C-l>` | Normal | Move to right window |
| `[b` | Normal | Previous buffer |
| `]b` | Normal | Next buffer |
| `[d` | Normal | Previous diagnostic |
| `]d` | Normal | Next diagnostic |
| `[q` | Normal | Previous quickfix item |
| `]q` | Normal | Next quickfix item |
| `[Q` | Normal | First quickfix item |
| `]Q` | Normal | Last quickfix item |

### Buffer Management

| Key | Mode | Action |
|-----|------|--------|
| `<leader>bd` | Normal | Delete buffer |
| `<leader><leader>` | Normal | List buffers (Telescope) |

### Window/View Management

| Key | Mode | Action |
|-----|------|--------|
| `<leader>vv` | Normal | Vertical split |
| `<leader>vh` | Normal | Horizontal split |
| `<leader>vd` | Normal | Close current view |

### Search (Telescope)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sf` | Normal | Find files |
| `<leader>sg` | Normal | Live grep (search in files) |
| `<leader>sw` | Normal | Grep current word |
| `<leader>st` | Normal | File tree browser (current file dir) |
| `<leader>sT` | Normal | File tree browser (cwd) |
| `<leader>sp` | Normal | Project switcher |
| `<leader>sh` | Normal | Search help tags |
| `<leader>sk` | Normal | Search keymaps |
| `<leader>ss` | Normal | Search select (Telescope pickers) |
| `<leader>sd` | Normal | Search diagnostics |
| `<leader>sr` | Normal | Resume last search |
| `<leader>s.` | Normal | Recent files |
| `<leader>s/` | Normal | Search in open files |
| `<leader>sn` | Normal | Search Neovim config files |
| `<leader>/` | Normal | Fuzzy search in current buffer |

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gr` | Normal | Go to references |
| `gI` | Normal | Go to implementation |
| `K` | Normal | Hover documentation |
| `<leader>D` | Normal | Type definition |
| `<leader>ds` | Normal | Document symbols |
| `<leader>ws` | Normal | Workspace symbols |
| `<leader>rn` | Normal | Rename symbol |
| `<leader>ca` | Normal | Code action |
| `<leader>th` | Normal | Toggle inlay hints |

### Code Formatting & Linting

| Key | Mode | Action |
|-----|------|--------|
| `<leader>tf` | Normal | Toggle format on save |
| `<leader>l` | Normal | Lint current buffer |

### Completion (Insert Mode)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | Insert | Next completion item |
| `<S-Tab>` | Insert | Previous completion item |
| `<CR>` | Insert | Confirm selection |
| `<C-Space>` | Insert | Trigger completion |
| `<C-l>` | Insert | Jump forward in snippet |
| `<C-h>` | Insert | Jump backward in snippet |

### Treesitter

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Normal/Visual | Init/expand selection |
| `<BS>` | Visual | Shrink selection |

### Debugging (DAP)

| Key | Mode | Action |
|-----|------|--------|
| `<F5>` | Normal | Continue/Start debugging |
| `<F1>` | Normal | Step into |
| `<F2>` | Normal | Step over |
| `<F3>` | Normal | Step out |
| `<F7>` | Normal | Toggle DAP UI |
| `<leader>b` | Normal | Toggle breakpoint |
| `<leader>B` | Normal | Set conditional breakpoint |

### Git

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gg` | Normal | Open LazyGit |

### Terminal

| Key | Mode | Action |
|-----|------|--------|
| `` ` `` | Normal | Toggle floating terminal |

### Text Manipulation

| Key | Mode | Action |
|-----|------|--------|
| `J` | Normal | Join lines (preserve cursor) |
| `J` | Visual | Move line(s) down |
| `K` | Visual | Move line(s) up |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |
| `<leader>p` | Visual | Paste without yanking |

### Comments

| Key | Mode | Action |
|-----|------|--------|
| `gc` | Normal/Visual | Toggle comment (operator) |
| `gcc` | Normal | Toggle current line comment |

### Surround (mini.surround)

| Key | Mode | Action |
|-----|------|--------|
| `sa` | Normal/Visual | Add surrounding |
| `sd` | Normal | Delete surrounding |
| `sr` | Normal | Replace surrounding |

Examples:
- `saiw)` - Surround word with parentheses
- `sd'` - Delete surrounding quotes
- `sr)'` - Replace parentheses with quotes

### Text Objects (mini.ai)

Enhanced text objects:
- `va)` - Visual select around parentheses
- `ci'` - Change inside quotes
- `yinq` - Yank inside next quote

### Code Screenshots (silicon)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pc` | Visual | Copy screenshot to clipboard |
| `<leader>ps` | Visual | Save screenshot to file |

### Diagnostics

| Key | Mode | Action |
|-----|------|--------|
| `<leader>e` | Normal | Show diagnostic error message |
| `<leader>q` | Normal | Open diagnostic quickfix list |

---

## Plugin List

### Core Plugins

#### Plugin Manager
- **lazy.nvim** - Modern plugin manager with lazy loading

#### LSP & Language Support
- **nvim-lspconfig** - LSP client configurations
- **mason.nvim** - LSP/DAP/linter/formatter installer
- **mason-lspconfig.nvim** - Bridge between Mason and lspconfig
- **mason-tool-installer.nvim** - Auto-install tools
- **fidget.nvim** - LSP progress notifications

**Configured Language Servers:**
- `terraformls` - Terraform
- `gopls` - Go
- `lua_ls` - Lua

#### Completion
- **nvim-cmp** - Completion engine
- **LuaSnip** - Snippet engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-path** - Path completion source
- **cmp_luasnip** - Snippet completion source

#### Syntax & Parsing
- **nvim-treesitter** - Modern syntax highlighting and code understanding

**Installed Parsers:**
bash, c, diff, git_config, git_rebase, gitattributes, gitcommit, gitignore, go, html, json, lua, markdown, markdown_inline, nix, regex, toml, vim, vimdoc, yaml

#### Formatting & Linting
- **conform.nvim** - Async formatter
- **nvim-lint** - Async linter

**Formatters by Language:**
- Bash: shfmt
- Go: goimports, gofumpt, golines
- JavaScript/JSON/YAML: eslint_d
- Lua: stylua
- Markdown: prettier

**Linters:**
- Go: golangci-lint

#### Debugging
- **nvim-dap** - Debug Adapter Protocol client
- **nvim-dap-ui** - UI for nvim-dap
- **nvim-dap-go** - Go debugging configuration
- **mason-nvim-dap.nvim** - DAP installer via Mason

#### Search & Navigation
- **telescope.nvim** - Fuzzy finder
- **telescope-fzf-native.nvim** - Native FZF sorter
- **telescope-ui-select.nvim** - Telescope UI for vim.ui.select
- **telescope-project.nvim** - Project management
- **telescope-file-browser.nvim** - File browser
- **plenary.nvim** - Lua utility library

#### UI & Appearance
- **catppuccin** - Color scheme (auto flavour based on system theme)
- **lualine.nvim** - Status line with custom bubble theme
- **nvim-web-devicons** - File icons (requires Nerd Font)
- **indent-blankline.nvim** - Indent guides
- **which-key.nvim** - Keybinding hints

#### Git Integration
- **gitsigns.nvim** - Git signs in gutter
- **lazygit.nvim** - LazyGit integration

#### Utilities
- **mini.nvim** - Collection of minimal plugins
  - mini.indentscope - Visual indent scope
  - mini.pairs - Auto bracket pairing
  - mini.align - Text alignment
  - mini.ai - Enhanced text objects
  - mini.surround - Surround operations
- **Comment.nvim** - Smart commenting
- **vim-sleuth** - Auto-detect indentation
- **toggleterm.nvim** - Floating terminal
- **todo-comments.nvim** - TODO/FIXME highlighting
- **snacks.nvim** - Quality of life features
- **silicon** - Code screenshot generator
- **nvim-just** - Justfile support

---

## LSP Configuration

### Installed Language Servers

#### Terraform (`terraformls`)
- Filetypes: `terraform`, `terraform-vars`
- Auto-formatting enabled
- Supports `.tf` and `.tfvars` files

#### Go (`gopls`)
- Filetypes: `go`, `gomod`, `gowork`, `gotmpl`
- Settings:
  - Complete unimported packages
  - Use placeholders in completions
  - Analyze unused parameters
- Formatters: goimports → gofumpt → golines
- Linter: golangci-lint

#### Lua (`lua_ls`)
- Runtime: LuaJIT
- Configured for Neovim development
- Includes Neovim API completions
- Call snippet style: Replace

### Adding New Language Servers

1. **Find the LSP server name:**
   ```vim
   :help lspconfig-all
   ```

2. **Add to `lua/plugins/lsp.lua`:**
   ```lua
   local servers = {
     -- Add your server here
     pyright = {},  -- Python
     rust_analyzer = {},  -- Rust
     tsserver = {},  -- TypeScript
   }
   ```

3. **Restart Neovim:**
   ```bash
   nvim
   ```
   Mason will auto-install the server.

### LSP Keybindings Available After Server Attaches

All LSP keybindings are buffer-local and only activate when an LSP server is attached to the current buffer.

---

## Customization

### Changing the Color Scheme

Edit `lua/plugins/theme.lua`:
```lua
return {
  'catppuccin/nvim',
  priority = 1000,
  opts = {
    flavour = 'mocha',  -- Change to: latte, frappe, macchiato, mocha, or auto
    transparent_background = false,  -- Set to false for solid background
  },
}
```

### Adjusting Options

Edit `lua/opts.lua`:
```lua
vim.opt.relativenumber = false  -- Disable relative numbers
vim.opt.scrolloff = 5           -- Change scroll offset
vim.opt.tabstop = 4             -- Change tab width
```

### Adding Custom Keybindings

Edit `lua/keys.lua`:
```lua
-- Example: Save file with Ctrl-S
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
```

### Disabling Format on Save

Two ways:
1. **Temporarily:** Press `<leader>tf` in Neovim
2. **Permanently:** Edit `lua/plugins/conform.lua`:
   ```lua
   vim.g.format_on_save = false  -- Change true to false
   ```

### Installing Additional Parsers

Treesitter parsers install automatically, but you can manually install:
```vim
:TSInstall python
:TSInstall rust
:TSInstall typescript
```

### Adding More Formatters

Edit `lua/plugins/conform.lua`:
```lua
formatters_by_ft = {
  python = { 'black', 'isort' },
  rust = { 'rustfmt' },
}
```

Then ensure tools are installed via Mason:
```vim
:Mason
```

---

## Health Check

### Running Health Check

```vim
:checkhealth
```

This will check:
- ✅ Neovim version (>= 0.9.4)
- ✅ Required executables (git, make, unzip, rg)
- ℹ️  Optional tools (fd, lazygit, prettier, stylua, goimports)
- ✅ Plugin health
- ✅ LSP servers
- ✅ Treesitter parsers

### Custom Health Check

Our config includes custom checks in `lua/kickstart/health.lua`:
```vim
:checkhealth kickstart
```

---

## Troubleshooting

### Plugins Not Loading

```vim
:Lazy sync
```

### LSP Not Working

1. Check LSP status:
   ```vim
   :LspInfo
   ```

2. Install LSP server:
   ```vim
   :Mason
   ```

3. Restart LSP:
   ```vim
   :LspRestart
   ```

### Treesitter Errors

Update parsers:
```vim
:TSUpdate
```

### Slow Startup

Check startup time:
```bash
nvim --startuptime startup.log
```

Profile plugins:
```vim
:Lazy profile
```

### Format on Save Not Working

1. Check conform status:
   ```vim
   :ConformInfo
   ```

2. Verify formatter is installed:
   ```vim
   :Mason
   ```

3. Check toggle state:
   ```vim
   :lua print(vim.g.format_on_save)
   ```

### Icons Not Showing

Install a [Nerd Font](https://www.nerdfonts.com/) and configure your terminal to use it.

Verify in Neovim:
```vim
:lua print(vim.g.have_nerd_font)
```

Should return `true`.

### Clear Everything and Reinstall

```bash
# Backup first!
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup

# Clone again
git clone <your-repo-url> ~/.config/nvim
nvim
```

---

## Performance Tips

1. **Disable unused features:** Edit plugin configs to disable features you don't use
2. **Lazy loading:** Most plugins are already lazy-loaded via events/commands
3. **Reduce parsers:** Remove unused Treesitter parsers from `ensure_installed`
4. **Disable formatters:** Turn off format-on-save for large files
5. **Use native FZF:** telescope-fzf-native is compiled for speed

---

## Project Structure Philosophy

This configuration follows the kickstart.nvim philosophy:
- **Single-file plugins:** Each plugin has its own file in `lua/plugins/`
- **Documented:** Extensive comments explain what each setting does
- **Modular:** Easy to add/remove plugins by adding/deleting files
- **Beginner-friendly:** Clear structure and helpful comments
- **Modern:** Uses latest Neovim features and best practices

---

## Updates

### Updating Plugins

```vim
:Lazy update
```

### Updating LSP Servers

```vim
:Mason
```
Press `U` to update all.

### Updating This Config

```bash
cd ~/.config/nvim
git pull
```

---

## Credits

- Based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Theme: [Catppuccin](https://github.com/catppuccin/nvim)
- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

---

## License

See [LICENSE.md](LICENSE.md)

---

## Quick Start Checklist

- [ ] Install Neovim >= 0.9.4
- [ ] Install a Nerd Font
- [ ] Install ripgrep (`rg`)
- [ ] Clone this repo to `~/.config/nvim`
- [ ] Launch Neovim (`nvim`)
- [ ] Wait for plugins to install
- [ ] Run `:checkhealth`
- [ ] Install optional tools via `:Mason`
- [ ] Learn keybindings (press `<Space>` to see which-key)
- [ ] Customize to your liking!

**Leader Key:** `<Space>`
**Help:** `:help` or `<leader>sh` for help search
**Keybinding Hints:** Just press `<Space>` and wait for which-key popup

Enjoy your Neovim experience! 🚀
