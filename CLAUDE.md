# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Pure Lua configuration.

## Architecture

### File Structure

```
init.lua                    # Minimal bootstrap (~25 lines)
lua/
  config/
    options.lua             # All vim options and globals
    autocmds.lua            # Autocommands
    keymaps.lua             # Key mappings
    functions.lua           # Custom Lua functions and commands
  plugins/
    init.lua                # All plugin specs in one file
after/
  ftplugin/                 # Filetype-specific settings (Lua)
  plugin/luasnip.lua        # Custom snippet definitions
```

### Key Architectural Decisions

- **Modular config**: Options, keymaps, autocmds, functions in `lua/config/`
- **Plugin configs**: All plugins in single `lua/plugins/init.lua` with organized sections
- **LSP**: Uses Neovim 0.11+ `vim.lsp.config()` API
- **Lazy loading**: Most plugins lazy-loaded via events, commands, or keys

### Leader Keys

- `<Space>` is the leader key
- `\` is the local leader

### Important Keymaps

LSP:
- `gd` - Go to definition
- `gr` - Find references (telescope)
- `K` - Hover documentation
- `<leader>rn` - Rename
- `<leader>ca` - Code action

Telescope:
- `<leader><space>` - Buffers
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fd` - Projects

Navigation (`lua/config/keymaps.lua`):
- `r`/`R` - Leap forward/backward
- `-` - Oil file browser
- `]q`/`[q` - Next/prev quickfix
- `]e`/`[e` - Next/prev diagnostic
- `<leader>jd/jt/jr` - Ansible role navigation

## Adding LSP Servers

Edit `lua/plugins/init.lua` (LSP section):
1. Add server name to `ensure_installed` list
2. Add `vim.lsp.config('server_name', { ... })` if custom settings needed
3. Add to `vim.lsp.enable({ ... })` list

## Adding Plugins

Edit `lua/plugins/init.lua` using lazy.nvim spec format. Plugins are organized by category with comment headers. Run `:Lazy` to manage plugins.
