return {

    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPre",
        opts = {
            char = '▏',
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            show_current_context = true,
            show_current_context_start = true,
            use_treesitter = true,
        },
    },

    {
        "SmiteshP/nvim-navic",
        lazy = true,
    },

    -- icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

    { 'norcalli/nvim-colorizer.lua', },
}
