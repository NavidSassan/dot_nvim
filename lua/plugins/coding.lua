return {

    -- snippets
    {
        "L3MON4D3/LuaSnip",
        opts = {
            history = true,
            delete_check_events = "TextChanged",
        },
        keys = {
            { "<c-k>",
                function()
                    return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<c-k>"
                end,
                expr = true, silent = true, mode = "i",
            },
            { "<c-k>", function() require("luasnip").jump(1) end, mode = "s" },
            { "<c-j>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } }, -- -1 for jumping backwards.
            {
                "<c-l>",
                function()
                    return require("luasnip").choice_active() and '<Plug>luasnip-next-choice' or '<c-l>'
                end,
                mode = "i"
            },
        },
    },

    -- auto completion
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-omni",
            "saadparwaiz1/cmp_luasnip",
            'andersevenrud/compe-tmux',
        },
    },

    { 'machakann/vim-sandwich' },
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },


    { 'gaoDean/autolist.nvim', enabled = false },
    { url = 'https://git.navidsassan.ch/navid.sassan/vim-tmux-runner.vim.git', },
    { 'lambdalisue/suda.vim', },
    {
        'chaoren/vim-wordmotion',
        enabled = false, -- somehow can't disable the default mappings...
        config = function()
            vim.g.wordmotion_nomap = true
        end,
        -- keys = {
        --     { "W", '<Plug>WordMotion_w', mode= {'n', 'x', 'o'} },
        -- },
    },
    { 'junegunn/vim-easy-align', },
    { 'mechatroner/rainbow_csv', },
    { 'michaeljsmith/vim-indent-object', },
    {
        'numToStr/Comment.nvim',
        config = function(plugin, opts)
            require('Comment').setup(opts)
        end
    },


    { 'windwp/nvim-ts-autotag', },
    {
        'ray-x/lsp_signature.nvim',
        config = function(plugin, opts)
            require('lsp_signature').setup(opts)
        end
    },
}
