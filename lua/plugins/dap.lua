return {

    {
        'jayp0521/mason-nvim-dap.nvim',
        config = function(plugin, opts)
            require('mason-nvim-dap').setup(opts)
        end
    },

    { 'mfussenegger/nvim-dap', },
    {
        'rcarriga/nvim-dap-ui',
        config = function(plugin, opts)
            require('dapui').setup(opts)
        end
    },
    { 'theHamsta/nvim-dap-virtual-text', },

}
