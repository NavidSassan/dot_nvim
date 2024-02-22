-- NOTE: since start plugins can possibly change existing highlight groups, it's important to make sure that your main colorscheme is loaded first. To ensure this you can use the priority=1000 field.

return {

    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        opts = { style = "moon" },
    },

    {
        'EdenEast/nightfox.nvim',
        lazy = true,
        priority = 1000,
    },

    {
        'ellisonleao/gruvbox.nvim',
        lazy = true,
        priority = 1000,
    },

    {
        'shaunsingh/solarized.nvim',
        lazy = true,
        priority = 1000,
    },

}
