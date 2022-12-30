vim.g.python3_host_prog = '/usr/bin/python3'

-- todo
vim.cmd('source $HOME/.config/nvim/plugins.vim')
vim.cmd('source $HOME/.config/nvim/functions.vim')
vim.cmd('source $HOME/.config/nvim/mappings.vim')


vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

vim.cmd([[colorscheme tokyonight-moon]])

vim.o.background = 'dark'

vim.o.cursorcolumn = true
vim.o.cursorline = true

vim.o.backup = true
vim.o.backupdir = vim.fn.expand('~/.local/share/nvim/backup')

vim.o.undodir = vim.fn.expand('~/.local/share/nvim/undo')
vim.o.undofile = true
vim.o.undolevels = 3000
vim.o.undoreload = 10000

vim.o.cmdheight = 2
vim.opt.diffopt:append('vertical')
vim.o.hidden = true
vim.o.inccommand = 'split'
vim.o.redrawtime = 100
vim.o.laststatus = 2
vim.o.breakindent = true
vim.o.list = true
vim.o.listchars = 'tab:--→,trail:•,nbsp:␣,extends:→,precedes:←'
vim.o.mouse = 'a'
vim.opt.nrformats:append('alpha')
vim.o.number = true
vim.o.ruler = true
vim.o.showbreak = '↪ '
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.wildmode = 'longest,list,full'
vim.o.grepprg = 'rg --vimgrep --no-heading --no-ignore'

vim.o.expandtab = true
vim.o.shiftwidth = 4
-- do not use this, as the comment handling is weird. if needed, try autoindent
-- vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4

-- default open folds
vim.o.foldlevelstart = 99

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
vim.o.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append('c')

-- Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
vim.o.signcolumn = 'yes'

-- netrw
vim.g.netrw_bufsettings = 'noma nomod nobl nowrap ro nornu'

-- vinegar will initialize with dot files hidden
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

-- prevent re-indent on :
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'yaml',
    callback = function()
        vim.highlight.on_yank()
        vim.opt_local.indentkeys:remove('<:>')
    end,
})

-- inbuilt vim-markdown
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'yaml'}
-- vim.g.markdown_folding = 1
vim.g.markdown_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.highlight.on_yank()
        vim.opt_local.foldlevel = 99
    end,
})

-- disable json conceal
vim.g.vim_json_syntax_conceal = 0

-- mason.nvim
require('mason').setup()

-- mason-lspconfig.nvim
require('mason-lspconfig').setup()

-- nvim-lspconfig
-- install pyright for lsp
-- npm config set prefix ~/.npm
-- npm i -g pyright
-- add ~/.npm/bin to $PATH
require'lspconfig'.pyright.setup{}
require'lspconfig'.ansiblels.setup{}
require'lspconfig'.esbonio.setup{}

-- lspsaga.nvim
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- nvim-compe
vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
    },

    source = {
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        path = true,
        snippets_nvim = true,
        tmux = true,
    },
}


-- lsp_signature.nvim
-- lua require'lsp_signature'.on_attach()

-- " snippets.nvim
-- local snippets = require'snippets'
-- -- local U = require'snippets.utils'
-- snippets.snippets = {
--     -- The _global dictionary acts as a global fallback.
--     -- If a key is not found for the specific filetype, then
--     --  it will be lookup up in the _global dictionary.
--     _global = {
--         -- Insert a basic snippet, which is a string.
--         todo = "TODO(navid.sassan): ";
--         lfedit = "Edited by navid.sassan@linuxfabrik.ch on ${=os.date('%Y-%m-%d')}.";
--         time = [[${=os.date("%H:%M")}]];
--         date = [[${=os.date("%Y-%m-%d")}]];
--         datetime = [[${=os.date("%Y-%m-%d %H:%M")}]];
--         ddate = [[${=os.date("%Y.%m.%d")}]];
--         lldate = [[${=os.date("%a, %d.%m.%Y")}]];
--     };
--     python = {
--         ifmain = [[
-- if __name__ == '__main__':
--     main()
-- ]];
--         ifmain_exc = [[
-- if __name__ == '__main__':
--     try:
--         main()
--     except Exception as e:
--         print_exc()
--         sys.exit(STATE_UNKNOWN)
-- ]];
--     };
-- }

-- indent-blankline.nvim
vim.g.indentLine_char = '▏'
require('indent_blankline').setup {
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
}

-- mechatroner/rainbow_csv
vim.g.disable_rainbow_key_mappings = 1

-- vimtex
vim.g.vimtex_view_method = 'zathura'

-- norcalli/nvim-colorizer.lua
require('colorizer').setup()

-- vim-airline
vim.g.airline_powerline_fonts = 1

-- nvim-treesitter
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
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    context_commentstring = {
        enable = true
    },
}
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'


vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/rst*',
    command = ':VtrSetCommand ./b-navid',
    group = vim.api.nvim_create_augroup('RstBNavid', {clear = true}),
})


-- nvim-navic
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


-- telescope
require('telescope').setup {
    pickers = {
        find_files = {
            no_ignore = true,
        }
    }
}

-- telescope-project.nvim
require'telescope'.load_extension('project')

-- autolist.nvim
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



-- highlight yanked text and copy it to the system clipboard
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup='IncSearch', timeout=500 }
        -- vim.fn.setreg('+', vim.fn.getreg(event['regname'])) i can't find regname in the event
        vim.cmd([[call setreg("+", getreg(v:event.regname))]])
    end,
    group = vim.api.nvim_create_augroup('YankHighlight', {clear = true}),
})

-- set correct filetype
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/Nextcloud/it/ssh/configs/*',
    callback = function()
        vim.o.filetype = 'sshconfig'
    end,
    group = vim.api.nvim_create_augroup('NextcloudSSHConfigs', {clear = true}),
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/git/lf/lfops/**/*.yml',
    callback = function()
        vim.o.filetype = 'yaml.ansible'
    end,
    group = vim.api.nvim_create_augroup('Ansible', {clear = true}),
})


-- lualine.nvim
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = '|',
    section_separators = '',
  },
}
