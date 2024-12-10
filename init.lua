vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")


vim.cmd('source $HOME/.config/nvim/functions.vim')
vim.cmd('source $HOME/.config/nvim/mappings.vim')


vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

vim.cmd([[colorscheme carbonfox]])
-- vim.cmd([[colorscheme dayfox]])
-- vim.o.background = 'dark'

vim.cmd([[packadd cfilter]])

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
vim.o.redrawtime = 300
vim.o.laststatus = 2
vim.o.breakindent = true
vim.o.list = true
vim.o.listchars = 'tab:--→,trail:•,nbsp:␣,extends:→,precedes:←'
vim.o.mouse = 'a'
vim.opt.nrformats:append('alpha')
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.showbreak = '↪ '
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = 'screen'
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

vim.o.foldenable = false -- disable folding at startup

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

-- manual dap config
local dap = require('dap')

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb'
}
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.python = {
    type = 'executable';
    command = '/home/navid.sassan/.local/share/nvim/mason/packages/debugpy/venv/bin/python';
    args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            return '/usr/bin/python'
        end;
    },
}

dap.adapters.php = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
}
dap.configurations.php = {
    {
        type = "php",
        request = "launch",
        name = "Listen for Xdebug",
        port = 9003,
        pathMappings = {
            -- ["/var/www/html/nextcloud"] = "${workspaceFolder}"
            ["/usr/share/icingaweb2/modules/director"] = "${workspaceFolder}"
        }
    }
}

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = {os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'},
}
dap.configurations.typescript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require'dap.utils'.pick_process,
        sourceMaps = true,
        cwd = vim.fn.getcwd(),
        outDir = "${workspaceFolder}/build",
        sourceRoot = "${workspaceFolder}/src",
        sourceMapPathOverrides = { ["webpack:///src/*"] = "${workspaceRoot}/src/*" },
        diagnosticLogging =  true,
    },
}

require("dap-vscode-js").setup({
    -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/js-debug-adapter/', -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = 'TRACE' -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})
for _, language in ipairs({ "typescript", "javascript" }) do
    require("dap").configurations[language] = {
        {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
        }
    }
end



-- nvim-compe
vim.o.completeopt = 'menuone,noselect'

-- lsp_signature.nvim
-- lua require'lsp_signature'.on_attach()


-- mechatroner/rainbow_csv
vim.g.disable_rainbow_key_mappings = 1

-- vimtex
vim.g.vimtex_quickfix_enabled = 0
vim.g.vimtex_view_method = 'zathura'

local navic = require("nvim-navic")
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

    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end


--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--  use this instead of require'lspconfig'
local servers = {
    ansiblels = {},
    clangd = {},
    esbonio = {},
    jsonls = {},
    ltex = {
        autostart = false, -- start with :lua require('lspconfig').ltex.launch()
        settings = {
            ltex = {
                language = 'en-GB',
            },
        },
    },
    phpactor = {},
    ruff = {},
    texlab = {},
    pyright = {},
    lua_ls = {
        settings = {
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
    },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        local autostart = true
        local settings = {}
        if servers[server_name] ~= nil then
            autostart = servers[server_name]['autostart']
            settings = servers[server_name]['settings']
        end
        require('lspconfig')[server_name].setup {
            autostart = autostart,
            capabilities = capabilities,
            on_attach = on_attach,
            settings = settings,
        }
    end,
}

-- nvim-cmp
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
    view = {
        entries = "custom" -- can be "custom", "wildmenu" or "native"
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
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
        end,
            {
                'i',
                's'
            }),
    }),
    sources = {
        {
            name = 'buffer',
            option = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end,
                keyword_pattern = [[\k\+]], -- required so that umlaute do not split the words
            },
        },
        {
            name = 'lazydev',
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        },
        { name = 'calc' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'omni' },
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

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '/*/rst*',
    command = ':VtrSetCommand ./b',
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

-- telescope-dap.nvim
require('telescope').load_extension('dap')

-- telescope-project.nvim
require'telescope'.load_extension('project')

vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', '<leader>fe', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics ([E]rrors)' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Search [H]elp' })
vim.keymap.set('n', '<leader>fm', require('telescope.builtin').marks, { desc = 'Search [M]arks' })
vim.keymap.set('n', '<leader>fd', require'telescope'.extensions.project.project, { desc = 'Project [D]rawer' })


-- -- autolist.nvim
-- require('autolist').setup({
--     colon = {
--         indent_raw = false,
--         preferred = "*"
--     },
--     invert = {
--         ul_marker = "*",
--     },
--     lists = {
--         preloaded = {
--             generic = {
--                 "unordered",
--                 "ascii",
--             },
--         },
--         filetypes = {
--             generic = {
--                 "markdown",
--                 "rst",
--                 "text",
--             },
--             },
--         },
--         -- normal_mappings = {
--             --  invert = { "<c-r>+[catch]" },
--             -- },
-- })


-- set correct filetype
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '/*/Nextcloud/IT/ssh/configs/*',
    callback = function()
        vim.o.filetype = 'sshconfig'
    end,
    group = vim.api.nvim_create_augroup('NextcloudSSHConfigs', {clear = true}),
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
    pattern = '/*/git/lf/lfops/**/*.yml',
    callback = function()
        vim.o.filetype = 'yaml.ansible'
    end,
    group = vim.api.nvim_create_augroup('Ansible', {clear = true}),
})

-- lualine.nvim
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
    },
    sections = {
        lualine_c = {
            { 'filename' },
            { navic.get_location, cond = navic.is_available },
        }
    }
}

-- Diagnostic keymaps
vim.keymap.set('n', '[e', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']e', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)


-- yanky.nvim
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

-- easier indenting, automatically re-selects the previous selection
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.opt.clipboard = "unnamedplus" -- sync with system clipboard


vim.opt.fillchars:append('diff:╱')


function Send_line()
    local current_line = vim.api.nvim_get_current_line()
    local command = string.format("~/git/lf/scripts/sendkeys --string '%s' --delay 0.05", current_line)
    os.execute(command)
end
vim.cmd('command SendLine lua Send_line()')


function Go_to_ansible_role_file(sub_path)
    -- Get the full path of the current file
    local current_path = vim.fn.expand('%:p')
    -- Find the roles directory in the path
    local roles_path = current_path:match("(.*roles/[^/]+)")

    if roles_path then
        -- Construct the full path to the target file
        local target_path = roles_path .. '/' .. sub_path

        -- Open the target file if it exists, otherwise print an error
        if vim.fn.filereadable(target_path) == 1 then
            vim.cmd('edit ' .. target_path)
        else
            print("File does not exist: " .. target_path)
        end
    else
        print("Not inside a role directory.")
    end
end

function Open_oil_in_ansible_role_dir()
    local current_path = vim.fn.expand('%:p')
    local roles_path = current_path:match("(.*roles/[^/]+)")

    if roles_path then
        -- Open Oil in the role directory
        vim.cmd('Oil ' .. roles_path)
    else
        print("Not inside a role directory.")
    end
end

-- Key mappings to navigate to specific files within the role
vim.api.nvim_set_keymap('n', '<leader>jd', ':lua Go_to_ansible_role_file("defaults/main.yml")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>jr', ':lua Go_to_ansible_role_file("README.md")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>jt', ':lua Go_to_ansible_role_file("tasks/main.yml")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>jo', ':lua Open_oil_in_ansible_role_dir()<CR>', { noremap = true, silent = true })
