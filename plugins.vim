" This file is managed by Ansible - do not edit
" 2021111901

" vim-plug
" https://github.com/junegunn/vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.neovim/plugged')

Plug 'EdenEast/nightfox.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'L3MON4D3/LuaSnip'
Plug 'SmiteshP/nvim-navic'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'andersevenrud/compe-tmux', {'branch': 'compe'}
Plug 'chaoren/vim-wordmotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'gaoDean/autolist.nvim'
Plug 'ggandor/leap.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git'
Plug 'junegunn/vim-easy-align'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lambdalisue/suda.vim'
Plug 'lervag/vimtex'
Plug 'lewis6991/gitsigns.nvim'
Plug 'liuchengxu/vim-which-key'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'machakann/vim-sandwich'
Plug 'mbbill/undotree'
Plug 'mechatroner/rainbow_csv'
Plug 'michaeljsmith/vim-indent-object'
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/playground'
Plug 'sakhnik/nvim-gdb'
Plug 'shaunsingh/solarized.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'tami5/lspsaga.nvim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-vinegar'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

Plug '~/git/private/ansible.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
