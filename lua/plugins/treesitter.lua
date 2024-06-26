return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
        opts = {
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                'bash',
                'c',
                'css',
                'html',
                'java',
                'javascript',
                'json',
                'kotlin',
                'lua',
                'markdown',
                'php',
                'python',
                'query',
                'regex',
                'rst',
                'vim',
                'vimdoc',
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
                    init_selection = 'gnn',
                    node_incremental = '<M-=>',
                    scope_incremental = '<C-s>',
                    node_decremental = '<M-->',
                },
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
                        ['ac'] = '@block.outer',
                        ['ic'] = '@block.inner',
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
        },
        config = function(plugin, opts)
            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    { 'nvim-treesitter/nvim-treesitter-textobjects', },
    { 'nvim-treesitter/playground', },
}

