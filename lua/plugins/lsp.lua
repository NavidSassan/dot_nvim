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
}
