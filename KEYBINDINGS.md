# Neovim Keybindings Quick Reference

**Leader Key:** `<Space>`

## 🔍 Search & Find (Telescope)

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep (search text in files) |
| `<leader>sw` | Search current word |
| `<leader>st` | File tree (current file directory) |
| `<leader>sT` | File tree (current working directory) |
| `<leader>sp` | Project switcher |
| `<leader>sh` | Search help |
| `<leader>sk` | Search keymaps |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>sn` | Search Neovim config |
| `<leader>/` | Search in current buffer |
| `<leader><leader>` | List open buffers |

## 📝 LSP (Language Server)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>th` | Toggle inlay hints |

## 🐛 Debugging (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Start/Continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle debug UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |

## 🗂️ Navigation

| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between windows |
| `[b` / `]b` | Previous/Next buffer |
| `[d` / `]d` | Previous/Next diagnostic |
| `[q` / `]q` | Previous/Next quickfix |
| `[Q` / `]Q` | First/Last quickfix |

## 🪟 Windows & Buffers

| Key | Action |
|-----|--------|
| `<leader>vv` | Vertical split |
| `<leader>vh` | Horizontal split |
| `<leader>vd` | Close window |
| `<leader>bd` | Delete buffer |

## ⚙️ Toggles

| Key | Action |
|-----|--------|
| `<leader>tf` | Toggle format on save |
| `<leader>th` | Toggle inlay hints |
| `` ` `` | Toggle terminal |

## ✏️ Editing

| Key | Mode | Action |
|-----|------|--------|
| `J` | Normal | Join lines (keep cursor) |
| `J` / `K` | Visual | Move line down/up |
| `n` / `N` | Normal | Next/Prev search (centered) |
| `<leader>p` | Visual | Paste without yanking |
| `gc` | Normal/Visual | Toggle comment |
| `gcc` | Normal | Comment line |

## 🔄 Surround (mini.surround)

| Key | Action | Example |
|-----|--------|---------|
| `sa` | Add surround | `saiw)` - surround word with () |
| `sd` | Delete surround | `sd'` - delete quotes |
| `sr` | Replace surround | `sr)'` - replace () with ' |

## 📋 Completion (Insert Mode)

| Key | Action |
|-----|--------|
| `<Tab>` | Next item |
| `<S-Tab>` | Previous item |
| `<CR>` | Confirm |
| `<C-Space>` | Trigger completion |
| `<C-l>` / `<C-h>` | Jump in snippet |

## 🎯 Treesitter Selection

| Key | Mode | Action |
|-----|------|--------|
| `<C-Space>` | Normal/Visual | Init/Expand selection |
| `<BS>` | Visual | Shrink selection |

## 🎨 Git

| Key | Action |
|-----|--------|
| `<leader>gg` | Open LazyGit |

## 🔧 Diagnostics

| Key | Action |
|-----|--------|
| `<leader>e` | Show error message |
| `<leader>q` | Quickfix list |
| `<leader>l` | Run linter |

## 💡 Tips

- Press `<Space>` and wait to see which-key hints
- Use `:Telescope keymaps` to search all keybindings
- LSP keybindings only work when LSP is attached
- Arrow keys are disabled in normal mode (use `hjkl`)

## 📚 Common Commands

| Command | Purpose |
|---------|---------|
| `:Lazy` | Plugin manager |
| `:Mason` | LSP/tool installer |
| `:checkhealth` | Health check |
| `:LspInfo` | LSP status |
| `:ConformInfo` | Formatter status |
| `:TSUpdate` | Update parsers |

---

**Pro Tip:** Open this file in a split for reference:
```vim
:vsplit ~/.config/nvim/KEYBINDINGS.md
```
