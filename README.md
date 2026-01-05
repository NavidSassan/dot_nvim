# Neovim Config

Welcome to my personal [Neovim](https://neovim.io/) config, and its incomplete documentation ;).

Always WIP.


## Plugins

### [aerial.nvim](https://github.com/stevearc/aerial.nvim)

Code outline/symbol tree. Supports LSP, treesitter, and markdown.

| Key | Action |
| --- | --- |
| `gO` | Toggle aerial outline |

Possible alternatives:

* [outline.nvim](https://github.com/hedyhli/outline.nvim)
* [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim)


### [cmp-omni](https://github.com/hrsh7th/cmp-omni)

"nvim-cmp source for omnifunc." omnifunc allows other plugins to provide autocomplete options, for example vimtex.


### [cmp-tmux](https://github.com/andersevenrud/cmp-tmux)

"Tmux completion source for nvim-cmp."


### [debugprint.nvim](https://github.com/andrewferrier/debugprint.nvim)

Insert debug print statements with file/line info and variable values. Supports 40+ languages.

Keymappings:

| Key | Action |
| --- | --- |
| `g?p` / `g?P` | Insert plain debug print below/above |
| `g?v` / `g?V` | Insert variable debug print below/above (auto-detects variable under cursor) |

Commands:

| Command | Action |
| --- | --- |
| `:Debugprint delete` | Remove all debug statements |
| `:Debugprint commenttoggle` | Toggle comments on debug lines |


### [dial.nvim](https://github.com/monaqa/dial.nvim)

Enhanced `<C-a>`/`<C-x>` increment/decrement with support for booleans, dates, and more.

| Key | Action |
| --- | --- |
| `<C-a>` | Increment (numbers, booleans, dates) |
| `<C-x>` | Decrement |
| `g<C-a>` | Increment (sequential in visual) |
| `g<C-x>` | Decrement (sequential in visual) |

Supports: `true`/`false`, `yes`/`no`, `on`/`off`, `enable`/`disable`, dates (`2025-01-04`), numbers.

Possible alternatives:

* [boole.nvim](https://github.com/nat-418/boole.nvim)
* [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler)


### [diffview.nvim](https://github.com/sindrets/diffview.nvim)

Nice git diffs with filelists.

Commands:

| Command                                                     | Action                                                                             |
| ---                                                         | ---                                                                                |
| `:DiffviewOpen origin/main...HEAD -- lua/diffview plugin`   | show diff between origin/main and HEAD for `lua/diffview` and `plugin`             |
| `:DiffviewRefresh`                                          | Update stats and entries in the file list of the current Diffview                  |
| `:DiffviewFileHistory include/this and/this :!but/not/this` | Opens a new file history view that lists all commits that affected the given paths |

Possible alternatives:

* [Gistory.vim](https://github.com/Tarmean/Gistory.vim)
* [gv.vim](https://github.com/junegunn/gv.vim)


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
* [mini.indentscope](https://github.com/nvim-mini/mini.indentscope)


### [lazydev.nvim](https://github.com/folke/lazydev.nvim)

"lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries."


### [leap.nvim](https://github.com/ggandor/leap.nvim)

"Leap is a general-purpose motion plugin"

Keymappings:

| Key | Action                                                                                        |
| --- | ---                                                                                           |
| `r` | followed by 2 characters offers an selection to jump to one of the matches (after the cursor) |
| `R` | same as `r`, but backwards / before the cursor                                                |
| `r` | same as `r`, but for operator-pending mode, for example after a `d`                           |
| `R` | same as `R`, but backwards and for operator-pending mode, for example after a `d`             |

TODO: last two keybinds do not work

"Entering traversal mode after the first input is a useful shortcut, especially in operator-pending mode, but it can also be used as a substitute for normal-mode f/t motions. s{char}`<enter>` is the same as f{char}, but works over multiple lines."

Possible alternatives:

* [lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim)
* [EasyMotion](https://github.com/easymotion/vim-easymotion)
* [Hop](https://github.com/phaazon/hop.nvim)
* [Quick-Scope](https://github.com/unblevable/quick-scope)


### [lsp_signature.nvim](https://github.com/ray-x/lsp_signature.nvim)

Show function signature as you type.


### [lspconfig](https://github.com/neovim/nvim-lspconfig)

Helpers for configuring LSP servers.


### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

"A blazing fast and easy to configure Neovim statusline written in Lua."

Possible alternatives:

* [feline.nvim](https://github.com/feline-nvim/feline.nvim)
* [lightline.vim](https://github.com/itchyny/lightline.vim)


### [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

Snippet engine written in Lua.

Keymappings:

| Key     | Action                                                              |
| ---     | ---                                                                 |
| `<C-k>` | Expand the snippet under the cursor or jump to the next insert node |
| `<C-j>` | Jump to the previous insert node                                    |
| `<C-l>` | Choose the next choice in a choice node                             |


### [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)

"Markdown Preview for (Neo)vim". Really fast preview, and synchronises cursor position from neovim to browser.

Possible alternatives:

* [peek.nvim](https://github.com/toppair/peek.nvim) (less features right now, requires deno for installation)


### [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)

"bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together."

Note: run `:PylspInstall pylsp-mypy pyls-isort pylsp-rope` after installing pylsp (see [README](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md)).


#### ltex LSP

* Grammar/Spell Checker
* ltex is configured with `autostart = false` because it's resource-intensive (runs LanguageTool via Java). To use it:

1. `:LspStart ltex` - Start the LSP server manually
2. `:Lazy load ltex-extra.nvim` - (Optional) Load extra features for dictionary management


### [mini.ai](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md)

Extended text objects with treesitter support. Works alongside `nvim-treesitter-textobjects` which provides the movement commands (`]m`, `[[`, etc.) while mini.ai handles the text object selection.

| Key | Action |
| --- | --- |
| `if`/`af` | Function (inner/around) |
| `ic`/`ac` | Class |
| `ia`/`aa` | Argument/parameter |
| `ii`/`ai` | Indent block |
| `iq`/`aq` | Quotes (`'`, `"`, `` ` ``) |
| `ib`/`ab` | Brackets (`()`, `[]`, `{}`) |
| `it`/`at` | HTML tags |

Use with operators: `daf` (delete function), `ciq` (change inner quotes), `vai` (select indent block), etc.


### [mini.clue](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-clue.md)

Show available keybindings in a floating window after pressing a prefix key. Includes "submodes" for window operations.

After `<C-w>` you can keep pressing:
- `h`/`j`/`k`/`l` to navigate windows
- `+`/`-`/`<`/`>` to resize windows

**Note on plugin mappings:** Plugin mappings with doubled letters (like `gcc` from mini.comment) need explicit clues. The `gen_clues.*()` functions only know about built-in Vim commands. When you press `gc`, mini.clue doesn't know that another `c` can follow, so the second keypress gets lost. Fix this by adding `{ mode = 'n', keys = 'gc', postkeys = 'g' }` to tell mini.clue to keep listening after `gc`.

Possible alternatives:

* [which-key.nvim](https://github.com/folke/which-key.nvim)
* [hydra.nvim](https://github.com/anuvyklack/hydra.nvim) (alternative for `postkeys`)


### [mini.comment](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-comment.md)

Comment/uncomment lines with treesitter support via `ts_context_commentstring`.

Keymappings:

| Key | Action |
| --- | --- |
| `gc{motion}` | Toggle comment over motion |
| `gcc` | Toggle comment on current line |
| `gc` (visual) | Toggle comment on selection |

Possible alternatives:

* [Comment.nvim](https://github.com/numToStr/Comment.nvim)
* [vim-commentary](https://github.com/tpope/vim-commentary)


### [mini.operators](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-operators.md)

Text edit operators for replace, exchange, and sort.

| Key | Action |
| --- | --- |
| `gz{motion}` | Replace with register |
| `gzz` | Replace line |
| `gz` (visual) | Replace selection |
| `gx{motion}` | Exchange text (use twice to swap) |
| `gxx` | Exchange line |
| `gs{motion}` | Sort text |
| `gss` | Sort line (characters) |

Possible alternatives:

* [opsort.vim](https://github.com/ralismark/opsort.vim) (would support visual-block column sorting / sorting lines by selected column)


### [mini.splitjoin](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-splitjoin.md)

Split and join arguments, array elements, etc. Toggles between single-line and multi-line formats.

| Key | Action |
| --- | --- |
| `gS` | Toggle split/join |

Examples: `gS` on `foo(a, b, c)` splits to multi-line; `gS` again joins back.

Possible alternatives:

* [treesj](https://github.com/Wansmer/treesj)
* [splitjoin.vim](https://github.com/AndrewRadev/splitjoin.vim)


### [mini.surround](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md)

Add, delete, replace surrounding pairs (brackets, quotes, tags, etc.).

| Key | Action |
| --- | --- |
| `sa{motion}{char}` | Add surrounding |
| `sd{char}` | Delete surrounding |
| `sr{old}{new}` | Replace surrounding |
| `sf{char}` | Find surrounding (forward) |
| `sF{char}` | Find surrounding (backward) |
| `sh{char}` | Highlight surrounding |

Examples: `saiw"` (surround word with quotes), `sd"` (delete quotes), `sr"'` (replace `"` with `'`).

Possible alternatives:

* [vim-sandwich](https://github.com/machakann/vim-sandwich)
* [nvim-surround](https://github.com/kylechui/nvim-surround)


### [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

"A completion engine plugin for neovim written in Lua." Configured with sources for LSP, buffer, path, cmdline, snippets, tmux, calc, and omni.

Keymappings:

| Key     | Action           |
| ---     | ---              |
| `<C-d>` | scroll docs down |
| `<C-f>` | scroll docs up   |

Possible alternatives:

* [mini.completion](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-completion.md) (simpler, but fewer sources - no tmux, path, calc, etc.)


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


### [nvim-spider](https://github.com/chrisgrieser/nvim-spider)

Subword motion - `w`, `e`, `b` stop at camelCase, snake_case boundaries and skip insignificant punctuation.

| Key | Action |
| --- | --- |
| `w` | Move to next subword |
| `e` | Move to end of subword |
| `b` | Move to previous subword |

Example: `myVariableName` → 3 stops (`my`, `Variable`, `Name`) instead of 1.

Possible alternatives:

* [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion)
* [neowords.nvim](https://github.com/backdround/neowords.nvim)


### [oil.nvim](https://github.com/stevearc/oil.nvim)

"A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer", basically better `vidir`.

Keymappings:

| Key | Action                |
| --- | ---                   |
| `-` | open parent directory |

Possible alternatives:

* [vim-vinegar](https://github.com/tpope/vim-vinegar)


### [vim-easy-align](https://github.com/junegunn/vim-easy-align)

Align text by delimiter. Uses vim regex.

Possible alternatives:

* [mini.align](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md) (uses Lua patterns instead of regex)


### [vim-tmux-runner.vim](https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git)

"A simple, vimscript only, command runner for sending commands from vim to tmux." My fork of <https://github.com/christoomey/vim-tmux-runner>.

| Key          | Action                                  |
| ---          | ---                                     |
| `<leader>pa` | Attach to a pane                        |
| `<leader>r`  | Run a command in the attached tmux pane |
| `<leader>sc` | Set the command to be run               |


### [yanky.nvim](https://github.com/gbprod/yanky.nvim)

Provides a yank-ring, allowing cycling through the yank history on paste. Also highlights yanks and pastes.

Keymappings:

| Key     | Action                                 |
| ---     | ---                                    |
| `<C-n>` | Cycle forward through the yank-ring.   |
| `<C-p>` | Cycle backwards through the yank-ring. |

Possible alternatives:

* [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua)


### [template](link-to-repo)

Description

Keymappings:

| Key | Action |
| --- | ---    |
| 1   | 2      |

Commands:

| Command | Action |
| ---     | ---    |
| 1       | 2      |


Possible alternatives:

*

## Plugins that I am considering

Also see my [neovim todo](https://github.com/stars/NavidSassan/lists/neovim-todo) GitHub stars.


## Plugins that I have decided against using
