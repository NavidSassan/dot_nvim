-- Leader keys (must be set before lazy.nvim)
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Python host
vim.g.python3_host_prog = '/usr/bin/python3'

-- Appearance
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.showbreak = '↪ '
vim.o.cmdheight = 2
vim.o.laststatus = 2

-- List characters
vim.o.list = true
vim.o.listchars = 'tab:--→,trail:•,nbsp:␣,extends:→,precedes:←'
vim.opt.fillchars:append('diff:╱')

-- Editing
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.breakindent = true
vim.opt.clipboard = "unnamedplus"

-- Search and grep
vim.o.inccommand = 'split'
vim.o.grepprg = 'rg --vimgrep --no-heading --no-ignore'

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = 'screen'

-- Completion
vim.o.completeopt = 'menuone,noselect'
vim.o.wildmode = 'longest,list,full'
vim.opt.shortmess:append('c')

-- Performance
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.redrawtime = 300

-- Backup and undo
vim.o.backup = true
vim.o.backupdir = vim.fn.expand('~/.local/share/nvim/backup')
vim.o.undodir = vim.fn.expand('~/.local/share/nvim/undo')
vim.o.undofile = true
vim.o.undolevels = 3000
vim.o.undoreload = 10000

-- Diagnostics
vim.diagnostic.config({
    float = { source = true },
})

-- Folding
vim.o.foldenable = false

-- Mouse
vim.o.mouse = 'a'

-- Diff
vim.opt.diffopt:append('vertical')

-- netrw
vim.g.netrw_bufsettings = 'noma nomod nobl nowrap ro nornu'
vim.g.netrw_list_hide = '\\(^\\|\\s\\s\\)\\zs\\.\\S\\+'

-- Markdown
vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'yaml'}
vim.g.markdown_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0

-- JSON
vim.g.vim_json_syntax_conceal = 0

-- rainbow_csv
vim.g.disable_rainbow_key_mappings = 1

-- vimtex
vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_view_method = 'zathura'

-- Load cfilter
vim.cmd.packadd('cfilter')

-- Custom filetypes
vim.filetype.add({
    extension = {
        fwf = 'yaml.fwf',
    },
    pattern = {
        ['.*/clf/.*%.ya?ml'] = 'yaml.clf',
        -- Only set yaml.ansible for real files; diffview buffers get plain yaml
        -- to prevent ansiblels from failing to spawn ansible-lint
        ['.*/git/.*/lfops.*/.*.yml'] = function(path, bufnr)
            if vim.fn.filereadable(path) == 1 then
                return 'yaml.ansible'
            end
            return 'yaml'
        end,
        ['.*/ssh/config'] = 'sshconfig',
    },
})
