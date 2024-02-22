Neovim Config
=============

Plugins
-------

nvim-ts-context-commentstring
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"A Neovim plugin for setting the commentstring option based on the cursor location in the file. The location is checked via treesitter queries."

* `Repo <https://github.com/JoosepAlviste/nvim-ts-context-commentstring>`_


LuaSnip
~~~~~~~

Snippet engine.

* `Repo <https://github.com/L3MON4D3/LuaSnip>`_

Keybinds:

.. csv-table::

    <C-k>, Expand the snippet under the cursor, or jump to the next insert node
    <C-j>, Jump to the previous insert node
    <C-l>, Choose the next choice in a choice node


nvim-navic
~~~~~~~~~~

"A simple statusline/winbar component that uses LSP to show your current code context." Useful for seeing the current position in large JSON files.

* `Repo <https://github.com/SmiteshP/nvim-navic>`_

Commands:

.. csv-table::

    :lua require'nvim-navic'.get_location(), Returns a pretty string with context information.

TODO: integrate in statusline.


toggle-lsp-diagnostics.nvim
~~~~~~~~~~~~~~~~~~~~~~~~~~~

"A Neovim plugin for toggling the LSP diagnostics. Turn all diagnostics on/off or turn on/off individual features of diagnostics (virtual text, underline, signs, etc...)."

* `Repo <https://github.com/WhoIsSethDaniel/toggle-lsp-diagnostics.nvim>`_

Commands:

.. csv-table::

    :ToggleDiag, Toggle ALL diagnostics on/off


indent_blankline
~~~~~~~~~~~~~~~~

"This plugin adds indentation guides to all lines (including empty lines). It uses Neovims virtual text feature and no conceal"

* `Repo <https://github.com/lukas-reineke/indent-blankline.nvim>`_
* Possible alternatives:

    * `indentLine <https://github.com/Yggdroot/indentLine>`_
    * `mini.indentscope https://github.com/echasnovski/mini.indentscope>`_


cmp-tmux
~~~~~~~~

"Tmux completion source for nvim-cmp."

* `Repo <https://github.com/andersevenrud/cmp-tmux>`_


cmp-omni
~~~~~~~~

"nvim-cmp source for omnifunc." omnifunc allows other plugins to provide autocomplete options, for example vimtex.


vim-wordmotion
~~~~~~~~~~~~~~

"More useful word motions for Vim". Makes the default word motions smaller, for CamelCase, snake_case, etc.

* `Repo <https://github.com/chaoren/vim-wordmotion>`_


editorconfig-vim
~~~~~~~~~~~~~~~~

Adds support for `EditorConfig <https://editorconfig.org/>`_ to neovim. It sets settings like indentation based on the EditorConfig config file.

* `Repo <https://github.com/editorconfig/editorconfig-vim>`_


lualine.nvim
~~~~~~~~~~~~

"A blazing fast and easy to configure Neovim statusline written in Lua."

* `Repo <https://github.com/nvim-lualine/lualine.nvim>`_
* Possible alternatives:

    * `feline.nvim <https://github.com/feline-nvim/feline.nvim>`_
    * `lightline.vim <https://github.com/itchyny/lightline.vim>`_


autolist.nvim
~~~~~~~~~~~~~

Automatic list continuation and formatting for neovim, especially useful for Markdown editing.

* `Repo <https://github.com/gaoDean/autolist.nvim>`_
* Possible alternatives:

    * `bullets.vim <https://github.com/dkarter/bullets.vim>`_

Keybinds:

.. csv-table::

    <tab>, indent the list item
    <c-tab>, detent the list item
    <c-r>, cycle list type or (un-)check checkboxes


leap.nvim
~~~~~~~~~

"Leap is a general-purpose motion plugin"

* `Repo <https://github.com/ggandor/leap.nvim>`_
* Possible alternatives:

    * `lightspeed.nvim <https://github.com/ggandor/lightspeed.nvim>`_
    * `EasyMotion <https://github.com/easymotion/vim-easymotion>`_
    * `Hop <https://github.com/phaazon/hop.nvim>`_
    * `Quick-Scope <https://github.com/unblevable/quick-scope>`_

Keybinds:

.. csv-table::

    s, followed by 2 characters offers an selection to jump to one of the matches (after the cursor)
    S, same as ``s``, but before the cursor
    z, same as ``s``, but for operator-pending mode, for example after a ``d``
    Z, same as ``z``, but before the cursor

"Entering traversal mode after the first input is a useful shortcut, especially in operator-pending mode, but it can also be used as a substitute for normal-mode f/t motions. s{char}<enter> is the same as f{char}, but works over multiple lines."


vim-tmux-runner.vim
~~~~~~~~~~~~~~~~~~~

"A simple, vimscript only, command runner for sending commands from vim to tmux."

* `Repo <https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git>`_, fork of https://github.com/christoomey/vim-tmux-runner

Keybinds:

.. csv-table::

    <leader>pa, Attach to a pane
    <leader>r, Run a command in the attached tmux pane
    <leader>sc, Set the command to be run

nvim-gdb
~~~~~~~~

Description

* `Repo <https://github.com/sakhnik/nvim-gdb>`_
* Possible alternatives:

    *

Keybinds:

.. csv-table::

    1, 2

Commands:

.. csv-table::

    1, 2

Installation

.. code-block:: bash

    sudo dnf install cmake gdb lldb rr g++ -y


Comment.nvim
~~~~~~~~~~~~

"Smart and Powerful commenting plugin for neovim" with native treesitter support for calculating `'commentstring'`.

* `Repo <https://github.com/numToStr/Comment.nvim>`_
* Possible alternatives:

    * `vim-commentary <https://github.com/tpope/vim-commentary>`_

Keybinds:

.. csv-table::

    gcc, line-wise comment
    gbc, block-wise comment
    gco, add comment below current line
    gcO, add comment above current line
    gcA, add comment at the end of line

neodev.nvim
~~~~~~~~~~~

"Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API."

* `Repo <https://github.com/folke/neodev.nvim>`_

nvim-cmp
~~~~~~~~

"A completion engine plugin for neovim written in Lua."

* `Repo <https://github.com/hrsh7th/nvim-cmp>`_

Keybinds:

.. csv-table::

    <C-d>, scroll docs down
    <C-f>, scroll docs up

yanky.nvim
~~~~~~~~~~

Provides a yank-ring, allowing cycling through the yank history on paste. Also highlights yanks and pastes.

* `Repo <https://github.com/gbprod/yanky.nvim>`_

Keybinds:

.. csv-table::

    <C-n>, Cycle forward through the yank-ring.
    <C-p>, Cycle backwards through the yank-ring.

hex.nvim
~~~~~~~~

Hex editor inside vim.

* `Repo <https://github.com/RaafatTurki/hex.nvim>`_

Commands:

.. csv-table::

    :HexDump, show hex view
    :HexAssemble, show "normal" view
    :HexToggle, toggle between views

oil.nvim
~~~~~~~~

"A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer", basically better `vidir`.

* `Repo <https://github.com/stevearc/oil.nvim>`_
* Possible alternatives:

    * `vim-vinegar <https://github.com/tpope/vim-vinegar>`_

Keybinds:

.. csv-table::

    -, open parent directory


diffview.nvim
~~~~~~~~~~~~~

Nice git diffs with filelists.

* `Repo <https://github.com/sindrets/diffview.nvim>`_


Commands:

.. csv-table::

    1, 2
    :DiffviewOpen origin/main...HEAD -- lua/diffview plugin, show diff between origin/main and HEAD for ``lua/diffview`` and ``plugin``
    :DiffviewToggleFiles, toggle file panel
    :DiffviewRefresh, Update stats and entries in the file list of the current Diffview
    :DiffviewFileHistory include/this and/this :!but/not/this, Opens a new file history view that lists all commits that affected the given paths

lspconfig
~~~~~~~~~

Helpers for configuring lsp servers.

* `Repo <https://github.com/neovim/nvim-lspconfig>`_

Keybinds:

.. csv-table::

    1, 2

Commands:

.. csv-table::

    1, 2


mason-lspconfig
~~~~~~~~~~~~~~~

"bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together."


* `Repo <https://github.com/williamboman/mason-lspconfig.nvim>`_

Note: Run ``:PylspInstall pylsp-mypy pyls-isort pylsp-rope`` after installing pylsp (see https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md).


lsp_signature.nvim
~~~~~~~~~~~~~~~~~~

Show function signature when you type

* `Repo <https://github.com/ray-x/lsp_signature.nvim>`_


template
~~~~~~~~

Description

* `Repo <>`_
* Possible alternatives:

    *

Keybinds:

.. csv-table::

    1, 2

Commands:

.. csv-table::

    1, 2
