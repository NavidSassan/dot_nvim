local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- RST files: set VTR command
autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '/*/rst*',
    command = ':VtrSetCommand $LF_GITLAB/001/project-docs/b',
    group = augroup('RstVtr', { clear = true }),
})
