" This file is managed by Ansible - do not edit
" 2021111901

if &compatible
    set nocompatible               " Be iMproved
endif

filetype plugin indent on
syntax enable

colorscheme tokyonight-moon
set background=dark

set cursorcolumn
set cursorline

set backup
set backupdir=~/.local/share/nvim/backup

set undodir=~/.local/share/nvim/undo
set undofile
set undolevels=3000
set undoreload=10000

set cmdheight=2
set diffopt+=vertical
set hidden
set inccommand=split
set redrawtime=100
set laststatus=2
set breakindent
set list
set listchars=tab:--→,trail:•,nbsp:␣,extends:→,precedes:←
set mouse=a
set nrformats+=alpha
set number
set ruler
set showbreak=↪\ 
set splitbelow splitright
set termguicolors
set timeoutlen=500
set wildmode=longest,list,full

set expandtab
set shiftwidth=4
" do not use this, as the comment handling is weird. if needed, try autoindent
" set smartindent
set softtabstop=4
set tabstop=4

" default open folds
set foldlevelstart=99

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" vinegar will initialize with dot files hidden
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" prevent re-indent on :
autocmd FileType yaml setl indentkeys-=<:>

" inbuilt vim-markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'yaml']
" let g:markdown_folding = 1
let g:markdown_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
au FileType markdown setlocal foldlevel=99

" json conceal
let g:vim_json_syntax_conceal = 0

" mason.nvim
lua require("mason").setup()

" mason-lspconfig.nvim
lua require("mason-lspconfig").setup()

" nvim-lspconfig
" install pyright for lsp
" npm config set prefix ~/.npm
" npm i -g pyright
" add ~/.npm/bin to $PATH
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.ansiblels.setup{}
lua require'lspconfig'.esbonio.setup{}

" lspsaga.nvim
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF

" nvim-compe
set completeopt=menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.path = v:true
let g:compe.source.tmux = v:true
let g:compe.source.snippets_nvim = v:true
" let g:compe.source.vsnip = v:true
" let g:compe.source.ultisnips = v:true

" lsp_signature.nvim
" lua require'lsp_signature'.on_attach()

" " snippets.nvim
" lua << EOF
" local snippets = require'snippets'
" -- local U = require'snippets.utils'
" snippets.snippets = {
"     -- The _global dictionary acts as a global fallback.
"     -- If a key is not found for the specific filetype, then
"     --  it will be lookup up in the _global dictionary.
"     _global = {
"         -- Insert a basic snippet, which is a string.
"         todo = "TODO(navid.sassan): ";
"         lfedit = "Edited by navid.sassan@linuxfabrik.ch on ${=os.date('%Y-%m-%d')}.";
"         time = [[${=os.date("%H:%M")}]];
"         date = [[${=os.date("%Y-%m-%d")}]];
"         datetime = [[${=os.date("%Y-%m-%d %H:%M")}]];
"         ddate = [[${=os.date("%Y.%m.%d")}]];
"         lldate = [[${=os.date("%a, %d.%m.%Y")}]];
"     };
"     python = {
"         ifmain = [[
" if __name__ == '__main__':
"     main()
" ]];
"         ifmain_exc = [[
" if __name__ == '__main__':
"     try:
"         main()
"     except Exception as e:
"         print_exc()
"         sys.exit(STATE_UNKNOWN)
" ]];
"     };
" }
" EOF

" indent-blankline.nvim
let g:indentLine_char = '▏'
lua << EOF
require("indent_blankline").setup {
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" mechatroner/rainbow_csv
let g:disable_rainbow_key_mappings = 1

" vimtex
let g:vimtex_view_method = 'zathura'

" norcalli/nvim-colorizer.lua
lua require 'colorizer'.setup()

" vim-airline
let g:airline_powerline_fonts = 1

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    context_commentstring = {
        enable = true
    },
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" onedark
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" vim-tmux-runner
autocmd FileType python nnoremap <buffer> <F9> :w <bar> :call VtrSendCommand('python2 ' . @%)<cr>
autocmd FileType python nnoremap <buffer> <F10> :w <bar> :call VtrSendCommand('python3 ' . @%)<cr>
" autocmd FileType rst :VtrSetCommand ./b-navid
augroup rst_b_navid
    " Remove all autocommands in this group
    autocmd!
    au BufNewFile,BufRead */rst* :VtrSetCommand ./b-navid wiki
    " au BufNewFile,BufRead */rst/projects/blog* :VtrSetCommand ./b-navid blog
    " au BufNewFile,BufRead */rst/projects/docs* :VtrSetCommand ./b-navid docs
    " au BufNewFile,BufRead */rst/projects/wiki* :VtrSetCommand ./b-navid wiki
augroup END

" could be improved: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f

set grepprg=rg\ --vimgrep\ --no-heading\ --no-ignore


let g:netrw_bufsettings = 'noma nomod nobl nowrap ro nornu'

" nvim-navic
lua << EOF
local navic = require("nvim-navic")

require("lspconfig").clangd.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}
require("lspconfig").jsonls.setup {
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
}


-- local components = {
--     active = {{}, {}, {}},
-- }

-- table.insert(components.active[1], {
--     provider = function()
--         return navic.get_location()
--     end,
--     enabled = function() return navic.is_available() end,
-- })

-- require("feline").setup({
--     components = components
-- })
EOF

" telescope
lua << EOF
require('telescope').setup {
    pickers = {
        find_files = {
            no_ignore = true,
        }
    }
}
EOF

" telescope-project.nvim
lua << EOF
require'telescope'.load_extension('project')
EOF

" autolist.nvim
lua << EOF
require('autolist').setup({
    colon = {
        indent_raw = false,
        preferred = "*"
    },
    invert = {
        ul_marker = "*",
    },
    lists = {
        preloaded = {
            generic = {
                "unordered",
                "ascii",
            },
        },
        filetypes = {
            generic = {
                "markdown",
                "rst",
                "text",
            },
            },
        },
        -- normal_mappings = {
            --  invert = { "<c-r>+[catch]" },
            -- },
})
EOF
