" This file is managed by Ansible - do not edit
" 2021111901

" vim-plug
" https://github.com/junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.neovim/plugged')

Plug 'EdenEast/nightfox.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'L3MON4D3/LuaSnip'
Plug 'RaafatTurki/hex.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'andersevenrud/compe-tmux'
Plug 'chaoren/vim-wordmotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'folke/neodev.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'gaoDean/autolist.nvim'
Plug 'gbprod/yanky.nvim'
Plug 'ggandor/leap.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git'
Plug 'j-hui/fidget.nvim'
Plug 'jayp0521/mason-nvim-dap.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lambdalisue/suda.vim'
Plug 'lervag/vimtex'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'mechatroner/rainbow_csv'
Plug 'mfussenegger/nvim-dap'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'rcarriga/nvim-dap-ui'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'sakhnik/nvim-gdb'
Plug 'shaunsingh/solarized.nvim'
Plug 'stevearc/oil.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

Plug '~/git/private/ansible.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
