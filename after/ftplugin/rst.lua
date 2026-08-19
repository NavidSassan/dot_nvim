vim.keymap.set('n', '<localleader>h', function()
    require('config.functions').rst_heading()
end, { buffer = true, silent = true, desc = 'Create RST heading underline' })

-- Match a whole run of backticks, so both the RST inline literal (``code``)
-- and a single-backtick pair pasted from Markdown are selected. Same as
-- MiniAi.gen_spec.pair('`', '`', { type = 'greedy' }), inlined so the ftplugin
-- does not have to load mini.ai on every RST buffer.
local backticks = '%f[`]`+()[^`]-()`+%f[^`]'

vim.b.miniai_config = {
    custom_textobjects = {
        ['`'] = { backticks },
        -- mini.ai reads an array as a sequence of steps, so the alternatives
        -- for `q` sit one level deeper (same shape as mini.ai's builtin `q`).
        q = { { "'().-()'", '"().-()"', backticks } },
    },
}

-- Surrounding backticks always come out doubled, and the input matches any
-- run, so `sr` ` ` rewrites a pasted Markdown `code` into RST ``code``.
vim.b.minisurround_config = {
    custom_surroundings = {
        ['`'] = {
            input = { backticks },
            output = { left = '``', right = '``' },
        },
    },
}

-- Invalidate treesitter parser on InsertLeave to fix broken highlighting after editing headings
vim.api.nvim_create_autocmd('InsertLeave', {
    buffer = 0,
    callback = function()
        local ok, parser = pcall(vim.treesitter.get_parser, 0, 'rst')
        if ok and parser then
            parser:invalidate(true)
        end
    end,
})
