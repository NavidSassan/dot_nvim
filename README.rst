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


cmp-tmux
~~~~~~~~

"Tmux completion source for nvim-cmp."

* `Repo <https://github.com/andersevenrud/cmp-tmux>`_


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

* Possible alternatives:

    * `lightspeed.nvim <https://github.com/ggandor/lightspeed.nvim>`_
    * `EasyMotion <https://github.com/easymotion/vim-easymotion>`_
    * `Hop <https://github.com/phaazon/hop.nvim>`_

Keybinds:

.. csv-table::

    s, followed by 2 characters offers an selection to jump to one of the matches (after the cursor)
    S, same as ``s``, but before the cursor
    z, same as ``s``, but for operator-pending mode, for example after a ``d``
    Z, same as ``z``, but before the cursor

"Entering traversal mode after the first input is a useful shortcut, especially in operator-pending mode, but it can also be used as a substitute for normal-mode f/t motions. s{char}<enter> is the same as f{char}, but works over multiple lines."


nvim-compe
~~~~~~~~~~

Todo, replace this with https://github.com/hrsh7th/nvim-cmp

* `Repo <https://github.com/hrsh7th/nvim-compe>`_


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

todo
----


https://github.com/junegunn/vim-easy-align
https://github.com/kyazdani42/nvim-web-devicons
https://github.com/lambdalisue/suda.vim
https://github.com/lervag/vimtex
https://github.com/liuchengxu/vim-which-key
https://github.com/machakann/vim-sandwich
https://github.com/mbbill/undotree
https://github.com/mechatroner/rainbow_csv
https://github.com/michaeljsmith/vim-indent-object
https://github.com/morhetz/gruvbox
https://github.com/neovim/nvim-lspconfig
https://github.com/norcalli/nvim-colorizer.lua
https://github.com/nvim-lua/plenary.nvim
https://github.com/nvim-lua/popup.nvim
https://github.com/nvim-telescope/telescope.nvim
https://github.com/nvim-treesitter/nvim-treesitter
https://github.com/sudormrfbin/cheatsheet.nvim
https://github.com/tami5/lspsaga.nvim
https://github.com/tpope/vim-abolish
https://github.com/tpope/vim-commentary
https://github.com/tpope/vim-fugitive
https://github.com/tpope/vim-repeat
https://github.com/tpope/vim-speeddating
https://github.com/tpope/vim-vinegar

* switch to nvim-cmp
* switch to packer.nvim
* switch to all lua config
