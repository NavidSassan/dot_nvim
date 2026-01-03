local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- YAML: prevent re-indent on :
autocmd('FileType', {
    pattern = 'yaml',
    callback = function()
        vim.opt_local.indentkeys:remove('<:>')
    end,
    group = augroup('YamlIndent', { clear = true }),
})

-- Markdown: set high fold level
autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.opt_local.foldlevel = 99
    end,
    group = augroup('MarkdownFold', { clear = true }),
})

-- RST files: set VTR command
autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '/*/rst*',
    command = ':VtrSetCommand $LF_GITLAB/001/project-docs/b',
    group = augroup('RstVtr', { clear = true }),
})

-- SSH configs in Nextcloud
autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '/*/ssh/config',
    callback = function()
        vim.bo.filetype = 'sshconfig'
    end,
    group = augroup('SshConfigs', { clear = true }),
})

-- Ansible filetype for lfops
autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '/*/git/lf/lfops*/**/*.yml',
    callback = function()
        vim.bo.filetype = 'yaml.ansible'
    end,
    group = augroup('AnsibleFiletype', { clear = true }),
})
