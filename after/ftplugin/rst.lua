vim.keymap.set('n', '<localleader>h', function()
    require('config.functions').rst_heading()
end, { buffer = true, silent = true, desc = 'Create RST heading underline' })

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
