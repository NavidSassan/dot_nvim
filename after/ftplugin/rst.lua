vim.keymap.set('n', '<localleader>h', function()
    require('config.functions').rst_heading()
end, { buffer = true, silent = true, desc = 'Create RST heading underline' })
