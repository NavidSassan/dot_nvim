local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- RST files: set VTR command
autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '/*/rst*',
    command = ':VtrSetCommand $LF_GITLAB/001/project-docs/b',
    group = augroup('RstVtr', { clear = true }),
})

-- Mirror yanks to the system clipboard with common indentation stripped (dedent).
-- The unnamed register keeps the original indentation for in-editor pasting.
autocmd('TextYankPost', {
    group = augroup('DedentSystemClipboard', { clear = true }),
    callback = function()
        local event = vim.v.event
        if event.operator ~= 'y' then
            return
        end

        local lines = event.regcontents

        -- Smallest leading-whitespace prefix across non-blank lines.
        local min_indent
        for _, line in ipairs(lines) do
            if line:match('%S') then
                local indent = line:match('^%s*')
                if min_indent == nil or #indent < #min_indent then
                    min_indent = indent
                end
            end
        end

        if min_indent and #min_indent > 0 then
            local stripped = {}
            for i, line in ipairs(lines) do
                stripped[i] = line:sub(#min_indent + 1)
            end
            vim.fn.setreg('+', stripped, event.regtype)
        else
            vim.fn.setreg('+', lines, event.regtype)
        end
    end,
})
