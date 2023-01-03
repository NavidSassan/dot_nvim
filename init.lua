vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

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

-- nvim-compe
vim.o.completeopt = 'menuone,noselect'

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

-- nvim-navic
local navic = require("nvim-navic")

-- nvim-treesitter
require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = {
        'bash',
        'c',
        'css',
        'help',
        'html',
        'java',
        'javascript',
        'json',
        'kotlin',
        'lua',
        'markdown',
        'python',
        'query',
        'regex',
        'rst',
        'vim',
        'yaml',
    },

    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
        },
    },
    context_commentstring = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
}
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
local on_attach = function(client, bufnr)

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame') -- TODO: better keymap
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

    navic.attach(client, bufnr)
end


--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    clangd = {},
    jsonls = {},
    sumneko_lua = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- mason
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- nvim-cmp
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
fallback()
            end
        end, { 'i', 's' }),
    },
    sources = {
        { name = 'buffer' },
        { name = 'calc' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'tmux' },
    },
}
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    },
        {
            { name = 'cmdline' }
        }
    )
})

-- fidget.nvim
require('fidget').setup()


vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '*/rst*',
    command = ':VtrSetCommand ./b-navid',
    group = vim.api.nvim_create_augroup('RstBNavid', {clear = true}),
})


-- telescope
require('telescope').setup {
    pickers = {
        find_files = {
            no_ignore = true,
        }
    }
}
require('telescope').load_extension('fzf') -- Enable telescope fzf native

-- telescope-project.nvim
require'telescope'.load_extension('project')

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fe', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fd', require'telescope'.extensions.project.project, { desc = 'Project [D]rawer' })


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

-- Comment.nvim
require('Comment').setup()

-- gitsigns.nvim
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)


-- neodev.nvim
require('neodev').setup()

-- yanky.nvim
require("yanky").setup({
    ring = {
        history_length = 20,
    },
    system_clipboard = {
        sync_with_ring = false,
    },
    highlight = {
        on_put = true,
        on_yank = true,
        timer = 500,
    },
    preserve_cursor_position = {
        enabled = true,
    },
})
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
-- vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
vim.keymap.set({"n","x"}, "y", "<Plug>(YankyYank)")


-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")


vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
