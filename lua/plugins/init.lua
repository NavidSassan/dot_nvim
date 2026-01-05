return {

    -- Colorschemes
    { "folke/tokyonight.nvim", lazy = true, priority = 1000, opts = { style = "moon" } },
    { 'EdenEast/nightfox.nvim', lazy = true, priority = 1000 },
    { 'ellisonleao/gruvbox.nvim', lazy = true, priority = 1000 },
    { 'shaunsingh/solarized.nvim', lazy = true, priority = 1000 },

    -- Utilities
    { "nvim-lua/plenary.nvim", lazy = true },

    -- UI
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        dependencies = { "SmiteshP/nvim-navic" },
        config = function()
            local navic = require("nvim-navic")
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
                    },
                },
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPre",
        opts = {
            indent = { char = '▏' },
            exclude = {
                filetypes = { "Trouble", "alpha", "dashboard", "help", "lazy", "neo-tree" },
            },
        },
    },
    { "SmiteshP/nvim-navic", lazy = true },
    {
        'echasnovski/mini.icons',
        lazy = true,
        init = function()
            package.preload['nvim-web-devicons'] = function()
                require('mini.icons').mock_nvim_web_devicons()
                return package.loaded['nvim-web-devicons']
            end
        end,
        opts = {},
    },
    { 'NvChad/nvim-colorizer.lua', event = "BufReadPre", opts = {} },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        opts = {
            ensure_installed = {
                'bash', 'c', 'css', 'html', 'java', 'javascript', 'json',
                'kotlin', 'lua', 'markdown', 'php', 'python', 'query',
                'regex', 'rst', 'vim', 'vimdoc', 'yaml',
            },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'gnn',
                    node_incremental = '<M-=>',
                    scope_incremental = '<C-s>',
                    node_decremental = '<M-->',
                },
            },
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
                    goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
                    goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
                    goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
                },
            },
        },
        config = function(_, opts)
            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    { 'nvim-treesitter/playground', cmd = "TSPlaygroundToggle" },
    { 'HiPhish/rainbow-delimiters.nvim', event = { 'BufReadPost', 'BufNewFile' } },

    -- LSP
    { "folke/lazydev.nvim", ft = "lua" },
    { 'williamboman/mason.nvim', cmd = { 'Mason', 'MasonInstall', 'MasonUpdate' }, opts = {} },
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'SmiteshP/nvim-navic',
        },
        config = function()
            local navic = require("nvim-navic")

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    local bufnr = args.buf

                    local nmap = function(keys, func, desc)
                        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                    end

                    nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
                    nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
                    nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
                    nmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
                    nmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
                    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
                    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
                    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')
                    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
                    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
                    nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
                    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, 'Workspace Add Folder')
                    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, 'Workspace Remove Folder')
                    nmap('<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, 'Workspace List Folders')

                    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
                        vim.lsp.buf.format()
                    end, { desc = 'Format current buffer with LSP' })

                    if client and client.server_capabilities.documentSymbolProvider then
                        navic.attach(client, bufnr)
                    end
                end,
            })

            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = {
                    'ansiblels', 'clangd', 'esbonio', 'jsonls',
                    'phpactor', 'ruff', 'texlab', 'pyright', 'lua_ls', 'typos_lsp',
                },
                automatic_enable = {
                    exclude = { 'ltex' },
                },
            }

            vim.lsp.config('*', { capabilities = capabilities })

            vim.lsp.config('ltex', {
                settings = { ltex = { language = 'en-GB' } },
            })

            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        diagnostics = { globals = { 'vim' } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            })

            vim.lsp.enable({
                'ansiblels', 'clangd', 'esbonio', 'jsonls',
                'phpactor', 'ruff', 'texlab', 'pyright', 'lua_ls', 'typos_lsp',
            })
        end,
    },
    {
        'barreiroleo/ltex-extra.nvim',
        lazy = true,
        opts = { path = vim.fn.expand("~") .. "/.local/share/ltex" },
    },

    -- Completion
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
            dofile(vim.fn.stdpath("config") .. "/after/plugin/luasnip.lua")
        end,
        keys = {
            { "<c-k>", function()
                local ls = require("luasnip")
                if ls.expand_or_locally_jumpable() then
                    ls.expand_or_jump()
                end
            end, silent = true, mode = { "i", "s" } },
            { "<c-j>", function()
                local ls = require("luasnip")
                if ls.locally_jumpable(-1) then
                    ls.jump(-1)
                end
            end, silent = true, mode = { "i", "s" } },
            { "<c-l>", function()
                local ls = require("luasnip")
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, silent = true, mode = { "i", "s" } },
        },
    },
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-omni",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "saadparwaiz1/cmp_luasnip",
            "andersevenrud/cmp-tmux",
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            cmp.setup {
                view = { entries = "custom" },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
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
                            keyword_pattern = [[\k\+]],
                        },
                    },
                    { name = 'lazydev', group_index = 0 },
                    { name = 'calc' },
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'omni' },
                    { name = 'tmux' },
                },
            }

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = 'buffer' } },
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources(
                    { { name = 'path' } },
                    { { name = 'cmdline' } }
                ),
            })
        end,
    },
    { 'ray-x/lsp_signature.nvim', event = "LspAttach", opts = {} },

    -- DAP
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'jayp0521/mason-nvim-dap.nvim',
            'mxsdev/nvim-dap-vscode-js',
        },
        config = function()
            local dap = require('dap')

            dap.adapters.lldb = {
                type = 'executable',
                command = '/usr/bin/lldb-vscode',
                name = 'lldb',
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
                type = 'executable',
                command = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/debugpy/venv/bin/python',
                args = { '-m', 'debugpy.adapter' },
            }
            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = "Launch file",
                    program = "${file}",
                    pythonPath = function() return '/usr/bin/python' end,
                },
            }

            dap.adapters.php = {
                type = "executable",
                command = "node",
                args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
            }
            dap.configurations.php = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003,
                    pathMappings = {
                        ["/usr/share/icingaweb2/modules/director"] = "${workspaceFolder}",
                    },
                },
            }

            dap.adapters.node2 = {
                type = 'executable',
                command = 'node',
                args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
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
                    name = 'Attach to process',
                    type = 'node2',
                    request = 'attach',
                    processId = require('dap.utils').pick_process,
                    sourceMaps = true,
                    cwd = vim.fn.getcwd(),
                    outDir = "${workspaceFolder}/build",
                    sourceRoot = "${workspaceFolder}/src",
                    sourceMapPathOverrides = { ["webpack:///src/*"] = "${workspaceRoot}/src/*" },
                    diagnosticLogging = true,
                },
            }

            require("dap-vscode-js").setup({
                debugger_path = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/js-debug-adapter/',
                adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
                log_file_path = vim.fn.stdpath('cache') .. '/dap_vscode_js.log',
            })

            for _, language in ipairs({ "typescript", "javascript" }) do
                dap.configurations[language] = {
                    {
                        type = "pwa-node",
                        request = "attach",
                        name = "Attach",
                        processId = require('dap.utils').pick_process,
                        cwd = "${workspaceFolder}",
                    },
                }
            end

            require('mason-nvim-dap').setup()
        end,
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        opts = {},
    },
    { 'theHamsta/nvim-dap-virtual-text', opts = {} },

    -- Editor
    {
        'stevearc/oil.nvim',
        lazy = false,
        keys = {
            { '-', function() return require("oil").open() end, desc = "Open parent directory" },
        },
        opts = {
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            delete_to_trash = true,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-p>"] = "actions.preview",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
            },
            use_default_keymaps = false,
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    {
        'sindrets/diffview.nvim',
        cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
        keys = {
            { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Open Diff View" },
            { "<leader>dvf", "<cmd>DiffviewFileHistory<cr>", desc = "Open File History Diff View" },
        },
    },
    {
        'gbprod/yanky.nvim',
        event = "VeryLazy",
        opts = {
            ring = { history_length = 20 },
            system_clipboard = { sync_with_ring = false },
            highlight = { on_put = true, on_yank = true, timer = 500 },
            preserve_cursor_position = { enabled = true },
        },
    },
    { 'editorconfig/editorconfig-vim', event = "BufReadPre" },
    {
        'RaafatTurki/hex.nvim',
        cmd = { 'HexDump', 'HexAssemble', 'HexToggle' },
        opts = { is_binary_file = function() return false end },
    },
    { 'j-hui/fidget.nvim', event = "LspAttach", opts = {} },
    { 'mbbill/undotree', cmd = "UndotreeToggle" },
    {
        "ggandor/leap.nvim",
        keys = {
            { "r", '<Plug>(leap-forward-to)', mode = { 'n', 'x', 'o' } },
            { "R", '<Plug>(leap-backward-to)', mode = { 'n', 'x', 'o' } },
        },
    },
    { dir = '~/git/private/ansible.nvim' },
    { 'tpope/vim-abolish', event = "VeryLazy" },
    { 'tpope/vim-fugitive', cmd = { "Git", "G", "Gdiffsplit", "Gclog", "Gread", "Gwrite" } },
    { 'tpope/vim-speeddating', keys = { '<C-a>', '<C-x>' } },
    { 'lervag/vimtex', ft = "tex" },
    { 'stsewd/sphinx.nvim', ft = "rst", build = ":UpdateRemotePlugins" },
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-project.nvim',
            'nvim-telescope/telescope-dap.nvim',
        },
        keys = {
            { '<leader><space>', function() require('telescope.builtin').buffers() end, desc = 'Find buffers' },
            { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find files' },
            { '<leader>fg', function() require('telescope.builtin').live_grep() end, desc = 'Live grep' },
            { '<leader>fe', function() require('telescope.builtin').diagnostics() end, desc = 'Diagnostics' },
            { '<leader>fh', function() require('telescope.builtin').help_tags() end, desc = 'Help tags' },
            { '<leader>fm', function() require('telescope.builtin').marks() end, desc = 'Marks' },
            { '<leader>fd', function() require('telescope').extensions.project.project() end, desc = 'Projects' },
        },
        config = function()
            local telescope = require('telescope')
            telescope.setup {
                defaults = {
                    path_display = { "truncate" },
                    file_ignore_patterns = { "node_modules", "%.git/" },
                    preview = {
                        filesize_limit = 0.5,
                        timeout = 250,
                    },
                },
                pickers = {
                    find_files = { no_ignore = true },
                },
            }
            telescope.load_extension('fzf')
            telescope.load_extension('dap')
            telescope.load_extension('project')
        end,
    },
    { 'itchyny/vim-qfedit', ft = "qf" },
    { 'chentoast/marks.nvim', event = "VeryLazy", opts = {} },
    {
        'stevearc/aerial.nvim',
        event = 'LspAttach',
        cmd = { 'AerialToggle', 'AerialOpen', 'AerialNavToggle' },
        -- Using on_attach instead of keys because lazy.nvim keys don't work reliably here
        opts = {
            on_attach = function(bufnr)
                vim.keymap.set('n', 'gO', '<cmd>AerialToggle<CR>', { buffer = bufnr, desc = 'Toggle Aerial outline' })
            end,
        },
    },
    {
        'chrisgrieser/nvim-spider',
        keys = {
            { 'w', "<cmd>lua require('spider').motion('w')<CR>", mode = { 'n', 'o', 'x' }, desc = 'Spider w' },
            { 'e', "<cmd>lua require('spider').motion('e')<CR>", mode = { 'n', 'o', 'x' }, desc = 'Spider e' },
            { 'b', "<cmd>lua require('spider').motion('b')<CR>", mode = { 'n', 'o', 'x' }, desc = 'Spider b' },
        },
    },
    {
        'nvim-mini/mini.clue',
        event = 'VeryLazy',
        opts = function()
            local clue = require('mini.clue')
            return {
                window = { delay = 200 },
                triggers = {
                    { mode = 'n', keys = '<Leader>' },
                    { mode = 'x', keys = '<Leader>' },
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },
                    { mode = 'n', keys = 'z' },
                    { mode = 'n', keys = '<C-w>' },
                    { mode = 'n', keys = '[' },
                    { mode = 'n', keys = ']' },
                    { mode = 'n', keys = "'" },
                    { mode = 'n', keys = '`' },
                    { mode = 'n', keys = '"' },
                    { mode = 'x', keys = '"' },
                    { mode = 'i', keys = '<C-r>' },
                    { mode = 'c', keys = '<C-r>' },
                },
                clues = {
                    clue.gen_clues.builtin_completion(),
                    clue.gen_clues.g(),
                    clue.gen_clues.marks(),
                    clue.gen_clues.registers(),
                    clue.gen_clues.square_brackets(),
                    clue.gen_clues.windows({ submode_navigate = true, submode_resize = true }),
                    clue.gen_clues.z(),
                    { mode = 'n', keys = 'gc', postkeys = 'g' },
                    { mode = 'x', keys = 'gc', postkeys = 'g' },
                },
            }
        end,
    },
    {
        'echasnovski/mini.misc',
        lazy = false,
        config = function()
            local misc = require('mini.misc')
            misc.setup()
            -- misc.setup_auto_root() it actually changes the cwd, which is annoying for grep
            misc.setup_restore_cursor()
        end,
    },

    -- Coding
    {
        'nvim-mini/mini.surround',
        event = "VeryLazy",
        opts = {
            custom_surroundings = {
                ['('] = { output = { left = '(', right = ')' } },
                [')'] = { output = { left = '( ', right = ' )' } },
                ['['] = { output = { left = '[', right = ']' } },
                [']'] = { output = { left = '[ ', right = ' ]' } },
                ['{'] = { output = { left = '{', right = '}' } },
                ['}'] = { output = { left = '{ ', right = ' }' } },
            },
        },
    },
    {
        'nvim-mini/mini.operators',
        keys = { 'gz', 'gx', 'gs' },
        opts = {
            replace = { prefix = 'gz' },
            multiply = { prefix = '' },
            evaluate = { prefix = '' },
        },
    },
    {
        'nvim-mini/mini.splitjoin',
        keys = { 'gS' },
        opts = {},
    },
    {
        'monaqa/dial.nvim',
        keys = {
            { '<C-a>', '<Plug>(dial-increment)', desc = 'Increment' },
            { '<C-x>', '<Plug>(dial-decrement)', desc = 'Decrement' },
            { '<C-a>', '<Plug>(dial-increment)', mode = 'v', desc = 'Increment' },
            { '<C-x>', '<Plug>(dial-decrement)', mode = 'v', desc = 'Decrement' },
            { 'g<C-a>', 'g<Plug>(dial-increment)', mode = 'v', desc = 'Increment (sequential)' },
            { 'g<C-x>', 'g<Plug>(dial-decrement)', mode = 'v', desc = 'Decrement (sequential)' },
        },
        config = function()
            local augend = require('dial.augend')
            require('dial.config').augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.constant.alias.bool,
                    augend.constant.new({ elements = { 'yes', 'no' } }),
                    augend.constant.new({ elements = { 'on', 'off' } }),
                    augend.constant.new({ elements = { 'enable', 'disable' } }),
                    augend.constant.new({ elements = { 'enabled', 'disabled' } }),
                    augend.constant.new({ elements = { 'True', 'False' } }),
                    augend.constant.new({ elements = { 'YES', 'NO' } }),
                    augend.constant.new({ elements = { 'ON', 'OFF' } }),
                    augend.date.alias['%Y-%m-%d'],
                    augend.date.alias['%Y/%m/%d'],
                    augend.date.alias['%d.%m.%Y'],
                },
            })
        end,
    },
    { url = 'https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git' },
    { 'lambdalisue/suda.vim' },
    { 'junegunn/vim-easy-align', keys = { { 'ga', mode = { 'n', 'x' } } } },
    { 'mechatroner/rainbow_csv', ft = 'csv' },
    { 'chrisbra/csv.vim', ft = 'csv' },
    {
        'nvim-mini/mini.ai',
        event = "VeryLazy",
        opts = function()
            local ai = require('mini.ai')
            return {
                n_lines = 500,
                custom_textobjects = {
                    -- Use treesitter for function/class/parameter
                    f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                    c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
                    a = ai.gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),
                },
            }
        end,
    },
    {
        'nvim-mini/mini.comment',
        event = "VeryLazy",
        opts = {
            options = {
                custom_commentstring = function()
                    return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
                end,
            },
        },
        dependencies = {
            {
                'JoosepAlviste/nvim-ts-context-commentstring',
                init = function() vim.g.skip_ts_context_commentstring_module = true end,
                opts = { enable_autocmd = false },
            },
        },
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        cmd = "Neogen",
        opts = {
            snippet_engine = "luasnip",
            languages = {
                python = { template = { annotation_convention = "numpydoc" } },
            },
        },
    },
    {
        "andrewferrier/debugprint.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        keys = {
            { "g?p", desc = "Debug print below" },
            { "g?P", desc = "Debug print above" },
            { "g?v", mode = { "n", "x" }, desc = "Debug print variable below" },
            { "g?V", mode = { "n", "x" }, desc = "Debug print variable above" },
        },
        cmd = "Debugprint",
        opts = {},
    },

    -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
        init = function() vim.g.mkdp_auto_close = 0 end,
    },
}
