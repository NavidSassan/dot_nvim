local map = vim.keymap.set
local functions = require('config.functions')

-- Diff operations
map('n', '<leader>dp', 'V:diffput<cr>', { silent = true, desc = 'Diff put' })
map('n', '<leader>do', 'V:diffget<cr>', { silent = true, desc = 'Diff get' })
map('n', '<leader>wdt', '<cmd>windo diffthis<cr>', { silent = true, desc = 'Diff this (all windows)' })
map('n', '<leader>wdo', '<cmd>windo diffoff<cr>', { silent = true, desc = 'Diff off (all windows)' })

-- Clear search highlight
map('n', '<leader>n', '<cmd>nohlsearch<cr>', { silent = true, desc = 'Clear search highlight' })

-- Delete to black hole register
map('n', 'D', '"_d', { desc = 'Delete to black hole' })

-- Argument list navigation
map('n', ']f', '<cmd>next<CR>', { desc = 'Next file in arglist' })
map('n', '[f', '<cmd>prev<CR>', { desc = 'Previous file in arglist' })
map('n', ']F', '<cmd>last<CR>', { desc = 'Last file in arglist' })
map('n', '[F', '<cmd>first<CR>', { desc = 'First file in arglist' })

-- Quickfix navigation
map('n', ']q', '<cmd>cnext<CR>', { desc = 'Next quickfix' })
map('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous quickfix' })
map('n', ']Q', '<cmd>clast<CR>', { desc = 'Last quickfix' })
map('n', '[Q', '<cmd>cfirst<CR>', { desc = 'First quickfix' })

-- Copy file:line to clipboard
map('n', '<leader>fl', function()
    vim.fn.setreg('+', vim.fn.expand('%') .. ':' .. vim.fn.line('.'))
end, { silent = true, desc = 'Copy file:line to clipboard' })

-- Inner line text object
map('x', 'il', 'g_o^o', { desc = 'Inner line' })
map('o', 'il', '<cmd>normal vil<CR>', { silent = true, desc = 'Inner line' })

-- Visual mode sort
map('x', 'gs', ':sort<cr>', { silent = true, desc = 'Sort selection' })

-- Select pasted text
map('n', 'gp', function()
    return '`[' .. vim.fn.strpart(vim.fn.getregtype(), 0, 1) .. '`]'
end, { expr = true, desc = 'Select pasted text' })

-- vim-fugitive
map('n', '<leader>gh', '<cmd>0Gclog<CR>', { silent = true, desc = 'Git file history' })
map('n', '<leader>gbl', '<cmd>Git blame<cr>', { silent = true, desc = 'Git blame' })
map('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { silent = true, desc = 'Git diff split' })

-- vim-tmux-runner
map('n', '<leader>pa', '<cmd>VtrAttachToPane<cr>', { silent = true, desc = 'Attach to tmux pane' })
map('n', '<leader>r', '<cmd>update<bar>VtrSendCommandToRunner<cr>', { silent = true, desc = 'Run command in tmux' })
map('n', '<leader>sc', '<cmd>VtrSetCommand<cr>', { silent = true, desc = 'Set tmux command' })

-- Ansible reload
map('n', '<leader>t', function()
    vim.cmd('write')
    require('reload').ansible()
end, { silent = true, desc = 'Reload ansible' })

-- Tab management
map('n', '<leader>tc', '<cmd>tabclose<cr>', { silent = true, desc = 'Close tab' })
map('n', '<leader>tn', '<cmd>tabnew<cr>', { silent = true, desc = 'New tab' })

-- Diagnostic navigation
map('n', '[e', function() vim.diagnostic.jump({ count = -1 }) end, { desc = 'Previous diagnostic' })
map('n', ']e', function() vim.diagnostic.jump({ count = 1 }) end, { desc = 'Next diagnostic' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })

-- Yanky.nvim
map({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)')
map({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)')
map({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)')
map('n', '<c-n>', '<Plug>(YankyCycleForward)')
map('n', '<c-p>', '<Plug>(YankyCycleBackward)')
map({ 'n', 'x' }, 'y', '<Plug>(YankyYank)')

-- Undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- Easier indenting with re-selection
map('v', '<', '<gv')
map('v', '>', '>gv')
