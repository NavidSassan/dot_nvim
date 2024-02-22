return {
    { 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim', },
    { 'folke/neodev.nvim', },
    { 'neovim/nvim-lspconfig', },
    {
        'williamboman/mason.nvim',
        config = function(plugin, opts)
            require("mason").setup(opts)
        end
    },
    { 'williamboman/mason-lspconfig.nvim', },
    {
        'barreiroleo/ltex-extra.nvim',
        ft = { "markdown", "tex" },
        dependencies = { "neovim/nvim-lspconfig" },
        config = function(plugin, opts)
            -- require("ltex_extra").setup(opts) todo: call this correctly according to the README
        end,
        opts = {
            -- string : relative or absolute paths to store dictionaries
            -- e.g. subfolder in current working directory: ".ltex"
            path = vim.fn.expand("~") .. "/.local/share/ltex",
        },
    }
}
