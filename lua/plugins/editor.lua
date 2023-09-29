return {

    -- better netrw
    {
        'stevearc/oil.nvim',
        keys = {
            { '-', function() return require("oil").open() end, desc = "Open parent directory"},
        },
        opts = {
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-s>"] = "actions.select_vsplit",
                ["<C-h>"] = "actions.select_split",
                ["<C-p>"] = "actions.preview",
                -- ["<C-c>"] = "actions.close",
                ["<C-l>"] = "actions.refresh",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
            },
            use_default_keymaps = false,
        },
        lazy = false, -- the lazy loading below does not work, and therefore starting with `nvim oil://` does not work
        -- init = function()
        --     if vim.fn.argc() == 1 then
        --         local stat = vim.loop.fs_stat(vim.fn.argv(0))
        --         if stat and stat.type == "directory" then
        --             require("lazy").load({ plugins = { "oil.nvim" } })
        --         end
        --     end
        --     if not require("lazy.core.config").plugins["oil.nvim"]._.loaded then
        --         vim.api.nvim_create_autocmd("BufNew", {
        --             callback = function()
        --                 if vim.fn.isdirectory(vim.fn.expand("<afile>")) == 1 then
        --                     require("lazy").load({ plugins = { "oil.nvim" } })
        --                     -- Once oil is loaded, we can delete this autocmd
        --                     return true
        --                 end
        --             end,
        --         })
        --     end
        -- end,
    },

    -- git signs
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
        'sindrets/diffview.nvim'
    },

    {
        'pwntester/octo.nvim',
        config = function(plugin, opts)
            require("octo").setup(opts)
        end
    },


    {
        'gbprod/yanky.nvim',
        opts = {
            ring = {
                history_length = 20,
            },
            system_clipboard = {
                sync_with_ring = false,
            },
            highlight = {
                on_put = true,
                on_yank = true,
                timer = 500,
            },
            preserve_cursor_position = {
                enabled = true,
            },
        },
    },

    { 'editorconfig/editorconfig-vim', },

    {
        'RaafatTurki/hex.nvim',
        opts = {
            -- function that runs on every buffer to determine if it's binary or not
            is_binary_file = function()
                return false
            end
        },
    },

    { 'j-hui/fidget.nvim', },
    { 'mbbill/undotree', },

    {
        "ggandor/leap.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>z", '<Plug>(leap-forward-to)', mode= {'n', 'x', 'o'} },
            { "<leader>Z", '<Plug>(leap-backward-to)', mode= {'n', 'x', 'o'} },
        },
    },

    { dir = '~/git/private/ansible.nvim', },

    { 'tpope/vim-abolish', },
    { 'tpope/vim-fugitive', },
    { 'tpope/vim-speeddating', },
    { 'lervag/vimtex', },

    { 'nvim-telescope/telescope-file-browser.nvim', },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    { 'nvim-telescope/telescope-project.nvim', },
    { 'nvim-telescope/telescope.nvim', },
    { 'nvim-telescope/telescope-dap.nvim', },

    {
        'chentoast/marks.nvim',
        config = function(plugin, opts)
            require("marks").setup(opts)
        end
    },

    {
        "folke/which-key.nvim",
        config = function(plugin, opts)
            require("which-key").setup(opts)
        end
    },
    -- disabled for now, as disabling autostart does not seem to work
    -- {
    --     'subnut/nvim-ghost.nvim',
    --     config = function(plugin, opts)
    --         vim.g.nvim_ghost_autostart = 0
    --
    --         -- require("nvim-ghost").setup(opts)
    --     end
    -- }
}
