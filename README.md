# Neovim Config

Welcome to my personal [Neovim](https://neovim.io/) config, and its incomplete documentation ;).

Always WIP.


## Plugins

### [Comment.nvim](https://github.com/numToStr/Comment.nvim)

"Smart and Powerful commenting plugin for neovim" with native treesitter support for calculating <span class="title-ref">'commentstring'</span>.

Possible alternatives:

* [mini.comment](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md)
* [vim-commentary](https://github.com/tpope/vim-commentary)

Keymappings:

| Key   | Action                         |
| ---   | ---                            |
| `gcc` | line-wise comment              |
| `gbc` | block-wise comment             |
| `gco` | add comment below current line |
| `gcO` | add comment above current line |
| `gcA` | add comment at the end of line |


### [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Snippet engine written in Lua.

Keymappings:

| Key     | Action                                                              |
| ---     | ---                                                                 |
| `<C-k>` | Expand the snippet under the cursor or jump to the next insert node |
| `<C-j>` | Jump to the previous insert node                                    |
| `<C-l>` | Choose the next choice in a choice node                             |


### [autolist.nvim](https://github.com/gaoDean/autolist.nvim)

Automatic list continuation and formatting for neovim, especially useful for Markdown editing.

Possible alternatives:

* [bullets.vim](https://github.com/dkarter/bullets.vim)

Keymappings:

| Key       | Action                                   |
| ---       | ---                                      |
| `<tab>`   | indent the list item                     |
| `<c-tab>` | detent the list item                     |
| `<c-r>`   | cycle list type or (un-)check checkboxes |


### [cmp-omni](https://github.com/hrsh7th/cmp-omni)

"nvim-cmp source for omnifunc." omnifunc allows other plugins to provide autocomplete options, for example vimtex.


### [cmp-tmux](https://github.com/andersevenrud/cmp-tmux)

"Tmux completion source for nvim-cmp."


### [diffview.nvim](https://github.com/sindrets/diffview.nvim)

Nice git diffs with filelists.

Possible alternatives:

* [Gistory.vim](https://github.com/Tarmean/Gistory.vim)

Commands:

| Command                                                     | Action                                                                             |
| ---                                                         | ---                                                                                |
| `:DiffviewOpen origin/main...HEAD -- lua/diffview plugin`   | show diff between origin/main and HEAD for `lua/diffview` and `plugin`             |
| `:DiffviewRefresh`                                          | Update stats and entries in the file list of the current Diffview                  |
| `:DiffviewFileHistory include/this and/this :!but/not/this` | Opens a new file history view that lists all commits that affected the given paths |


### [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)

Adds support for [EditorConfig](https://editorconfig.org/) to neovim. It sets settings like indentation based on the EditorConfig config file.


### [hex.nvim](https://github.com/RaafatTurki/hex.nvim)

Hex editor inside vim.

Commands:

| Command        | Action               |
| ---            | ---                  |
| `:HexDump`     | show hex view        |
| `:HexAssemble` | show "normal" view   |
| `:HexToggle`   | toggle between views |


### [indent_blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

"This plugin adds indentation guides to all lines (including empty lines). It uses Neovims virtual text feature and no conceal"

Possible alternatives:

* [indentLine](https://github.com/Yggdroot/indentLine)
* [mini.indentscope](https://github.com/echasnovski/mini.indentscope)


### [leap.nvim](https://github.com/ggandor/leap.nvim)

"Leap is a general-purpose motion plugin"

Possible alternatives:

* [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
* [EasyMotion](https://github.com/easymotion/vim-easymotion)
* [Hop](https://github.com/phaazon/hop.nvim)
* [Quick-Scope](https://github.com/unblevable/quick-scope)

Keymappings:

| Key | Action                                                                                        |
| --- | ---                                                                                           |
| `r` | followed by 2 characters offers an selection to jump to one of the matches (after the cursor) |
| `R` | same as `r`, but backwards / before the cursor                                                |
| `r` | same as `r`, but for operator-pending mode, for example after a `d`                           |
| `R` | same as `R`, but backwards and for operator-pending mode, for example after a `d`             |

TODO: last two keybinds do not work

"Entering traversal mode after the first input is a useful shortcut, especially in operator-pending mode, but it can also be used as a substitute for normal-mode f/t motions. s{char}`<enter>` is the same as f{char}, but works over multiple lines."


### [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)

Show function signature as you type.


### [lspconfig](https://github.com/neovim/nvim-lspconfig)

Helpers for configuring LSP servers.



### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

"A blazing fast and easy to configure Neovim statusline written in Lua."

Possible alternatives:

* [feline.nvim](https://github.com/feline-nvim/feline.nvim)
* [lightline.vim](https://github.com/itchyny/lightline.vim)


### [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

"Markdown Preview for (Neo)vim". Really fast preview, and synchronises cursor position from neovim to browser.

Possible alternatives:

* [peek.nvim](https://github.com/toppair/peek.nvim) (less features right now, requires deno for installation)


### [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)

"bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together."

Note: run `:PylspInstall pylsp-mypy pyls-isort pylsp-rope` after installing pylsp (see [README](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md)).


### [neodev.nvim](https://github.com/folke/neodev.nvim)

"Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API."


### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

"A completion engine plugin for neovim written in Lua."

Keymappings:

| Key     | Action           |
| ---     | ---              |
| `<C-d>` | scroll docs down |
| `<C-f>` | scroll docs up   |


### [nvim-gdb](https://github.com/sakhnik/nvim-gdb)

TODO: Description

Possible alternatives:

* 

Keymappings:

| Key | Action |
| --- | ---    |
| 1   | 2      |

Commands:

| Command | Action |
| ---     | ---    |
| 1       | 2      |

Installation:

```bash
sudo dnf install cmake gdb lldb rr g++ -y
```


### [nvim-navic](https://github.com/SmiteshP/nvim-navic)

"A simple statusline/winbar component that uses LSP to show your current code context." Useful for seeing the current position in large JSON files.

Commands:

| Command                                   | Action                                            |
| ---                                       | ---                                               |
| `:lua require'nvim-navic'.get_location()` | Returns a pretty string with context information. |

TODO: integrate in statusline.


### [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)

"A Neovim plugin for setting the commentstring option based on the cursor location in the file. The location is checked via treesitter queries."

Comment.nvim has in-built treesitter support, but recommends to use this plugin for "advanced use cases".
Helped me prevent `Comment.nvim: nil` messages.


### [oil.nvim](https://github.com/stevearc/oil.nvim)

"A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer", basically better `vidir`.

Possible alternatives:

* [vim-vinegar](https://github.com/tpope/vim-vinegar)

Keymappings:

| Key | Action                |
| --- | ---                   |
| `-` | open parent directory |


### [toggle-lsp-diagnostics.nvim](https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim)

"A Neovim plugin for toggling the LSP diagnostics. Turn all diagnostics on/off or turn on/off individual features of diagnostics (virtual text, underline, signs, etc...)."

Commands:

| Command       | Action                        |
| ---           | ---                           |
| `:ToggleDiag` | Toggle ALL diagnostics on/off |


### [vim-tmux-runner.vim](https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git)

"A simple, vimscript only, command runner for sending commands from vim to tmux." My fork of <https://github.com/christoomey/vim-tmux-runner>.

| Key          | Action                                  |
| ---          | ---                                     |
| `<leader>pa` | Attach to a pane                        |
| `<leader>r`  | Run a command in the attached tmux pane |
| `<leader>sc` | Set the command to be run               |


### [yanky.nvim](https://github.com/gbprod/yanky.nvim)

Provides a yank-ring, allowing cycling through the yank history on paste. Also highlights yanks and pastes.

Possible alternatives:

* [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)

Keymappings:

| Key     | Action                                 |
| ---     | ---                                    |
| `<C-n>` | Cycle forward through the yank-ring.   |
| `<C-p>` | Cycle backwards through the yank-ring. |


### [vim-wordmotion](https://github.com/chaoren/vim-wordmotion)

"More useful word motions for Vim". Makes the default word motions smaller, for CamelCase, snake_case, etc.

TODO: replace with https://github.com/backdround/neowords.nvim? or https://github.com/chrisgrieser/nvim-spider?


### [template](link-to-repo)

Description

Possible alternatives:

* 

Keymappings:

| Key | Action |
| --- | ---    |
| 1   | 2      |

Commands:

| Command | Action |
| ---     | ---    |
| 1       | 2      |



## Plugins that I am considering

Also see my [neovim todo](https://github.com/stars/NavidSassan/lists/neovim-todo) GitHub stars.

### https://github.com/gbprod/substitute.nvim

allows pasting text without storing the overwritten text (at least that's what I'm hoping for)

possbile alternatives:

* https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-operators.md



## Plugins that I have decided against using
