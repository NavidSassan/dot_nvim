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
            indent = {
                char = '▏',
            },
            exclude = {
                filetypes = {
                    "Trouble",
                    "alpha",
                    "dashboard",
                    "help",
                    "lazy",
                    "neo-tree",
                },
            },
        },
    },

    {
        "SmiteshP/nvim-navic",
        lazy = true,
    },

    -- icons
    { "nvim-tree/nvim-web-devicons", lazy = true },

    { 'NvChad/nvim-colorizer.lua', },
}
