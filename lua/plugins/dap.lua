return {

    {
        'jayp0521/mason-nvim-dap.nvim',
        config = function(plugin, opts)
            require('mason-nvim-dap').setup(opts)
        end
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function(plugin, opts)
            require('dapui').setup(opts)
        end
    },
    { 'theHamsta/nvim-dap-virtual-text', },

    { 'mxsdev/nvim-dap-vscode-js' }

}
