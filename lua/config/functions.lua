local map = vim.keymap.set
local M = {}

-- Remove trailing whitespace
function M.rmtw()
    local winview = vim.fn.winsaveview()
    local oldsearch = vim.fn.getreg('/')
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(winview)
    vim.fn.setreg('/', oldsearch)
end
vim.api.nvim_create_user_command('Rmtw', M.rmtw, {})

-- Set tab width
function M.tab_width(width)
    local w = tonumber(width)
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = w
    vim.opt_local.softtabstop = w
    vim.opt_local.shiftwidth = w
end
vim.api.nvim_create_user_command('TabWidth', function(opts)
    M.tab_width(opts.args)
end, { nargs = 1 })

-- Update DNS serial zone
function M.update_dns_serial_zone()
    local line = vim.api.nvim_get_current_line()
    local serial = line:match('([12][90]%d%d[01]%d[0-3]%d%d%d)')
    local new_serial = os.date('%Y%m%d') .. '01'

    if not serial then
        vim.notify('No serial found on line!', vim.log.levels.WARN)
        vim.api.nvim_set_current_line(line .. new_serial)
    else
        if serial:match(os.date('%Y%m%d') .. '%d%d') then
            new_serial = tostring(tonumber(serial) + 1)
        end
        local new_line = line:gsub(serial, new_serial, 1)
        vim.api.nvim_set_current_line(new_line)
        vim.notify('Old serial = "' .. serial .. '" updated to = "' .. new_serial .. '"')
    end
end
map('n', '<C-e>', M.update_dns_serial_zone, { desc = 'Update DNS serial' })
map('i', '<C-e>', function() M.update_dns_serial_zone() end, { desc = 'Update DNS serial' })

function M.uuidgen()
    return vim.trim(vim.fn.system("uuidgen"))
end

-- Replace all GUIDs in buffer
function M.replace_guids()
    vim.cmd([[%s/\v[0-9A-Fa-f]{8}(-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}/\=luaeval("require('config.functions').uuidgen()")/g]])
end

-- Generate password using external genpw command
function M.genpw()
    return vim.trim(vim.fn.system("genpw"))
end

-- Replace passwords in buffer
function M.replace_pws()
    vim.cmd([[%s/\vpassword: '\zs.*\ze'/\=luaeval("require('config.functions').genpw()")/g]])
end

-- Create RST heading underline
function M.rst_heading()
    local line = vim.api.nvim_get_current_line()
    local len = #line
    if len == 0 then
        vim.notify('Line empty', vim.log.levels.WARN)
        return
    end
    local char = vim.fn.nr2char(vim.fn.getchar())
    local underline = string.rep(char, len)
    local row = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, row, row, false, { underline })
    vim.cmd('normal! jo')
end

-- Diff buffer against saved file
function M.diff_unsaved()
    local ft = vim.bo.filetype
    vim.cmd('diffthis')
    vim.cmd('vnew | r # | normal! 1Gdd')
    vim.cmd('diffthis')
    vim.cmd('setlocal bt=nofile bh=wipe nobl noswf ro ft=' .. ft)
end
vim.api.nvim_create_user_command('DiffUnsaved', M.diff_unsaved, {})

-- Custom diff expression
function M.my_diff()
    local args = { "diff", "-a", "--binary" }
    if vim.g.diffopts then
        for opt in vim.g.diffopts:gmatch("%S+") do
            table.insert(args, opt)
        end
    end
    if vim.o.diffopt:match("icase") then table.insert(args, "-i") end
    if vim.o.diffopt:match("iwhite") then table.insert(args, "-b") end
    table.insert(args, vim.v.fname_in)
    table.insert(args, vim.v.fname_new)
    local result = vim.fn.system(args)
    vim.fn.writefile(vim.split(result, "\n", { plain = true }), vim.v.fname_out)
end
vim.o.diffexpr = "v:lua.require'config.functions'.my_diff()"

-- Replace German umlauts (single pass, in document order)
M.umlaut_map = { Ae = 'Ä', ae = 'ä', Oe = 'Ö', oe = 'ö', Ue = 'Ü', ue = 'ü' }
function M.umlaute()
    vim.cmd([[%s/\v(Ae|ae|Oe|oe|Ue|ue)/\=luaeval("require'config.functions'.umlaut_map[_A]", submatch(0))/gce]])
end
vim.api.nvim_create_user_command('Umlaute', M.umlaute, {})

-- Sort SSH config blocks alphabetically by Host line
function M.sort_ssh_config()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local blocks, current = {}, {}

    for _, line in ipairs(lines) do
        if line:match("^Host%s") and #current > 0 then
            table.insert(blocks, current)
            current = {}
        end
        table.insert(current, line)
    end
    if #current > 0 then
        table.insert(blocks, current)
    end

    table.sort(blocks, function(a, b)
        return a[1]:lower() < b[1]:lower()
    end)

    local result = {}
    for _, block in ipairs(blocks) do
        vim.list_extend(result, block)
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, result)
end
vim.api.nvim_create_user_command('SortSshConfig', M.sort_ssh_config, {})

-- Send current line to tmux
function M.send_line()
    local current_line = vim.api.nvim_get_current_line()
    vim.fn.system({ vim.fn.expand("~/git/lf/scripts/sendkeys"), "--string", current_line, "--delay", "0.05" })
end
vim.api.nvim_create_user_command('SendLine', M.send_line, {})

-- Ansible role navigation (from init.lua)
function M.go_to_ansible_role_file(sub_path)
    local current_path = vim.fn.expand('%:p')
    local roles_path = current_path:match("(.*roles/[^/]+)")

    if roles_path then
        local target_path = roles_path .. '/' .. sub_path
        if vim.fn.filereadable(target_path) == 1 then
            vim.cmd('edit ' .. target_path)
        else
            vim.notify("File does not exist: " .. target_path, vim.log.levels.ERROR)
        end
    else
        vim.notify("Not inside a role directory.", vim.log.levels.WARN)
    end
end

function M.open_oil_in_ansible_role_dir()
    local current_path = vim.fn.expand('%:p')
    local roles_path = current_path:match("(.*roles/[^/]+)")

    if roles_path then
        vim.cmd('Oil ' .. roles_path)
    else
        vim.notify("Not inside a role directory.", vim.log.levels.WARN)
    end
end
-- Ansible role navigation
map('n', '<leader>jd', function() M.go_to_ansible_role_file("defaults/main.yml") end, { silent = true, desc = 'Jump to role defaults' })
map('n', '<leader>jr', function() M.go_to_ansible_role_file("README.md") end, { silent = true, desc = 'Jump to role README' })
map('n', '<leader>jt', function() M.go_to_ansible_role_file("tasks/main.yml") end, { silent = true, desc = 'Jump to role tasks' })
map('n', '<leader>jo', M.open_oil_in_ansible_role_dir, { silent = true, desc = 'Open Oil in role dir' })

-- Ansible doc command
vim.api.nvim_create_user_command('AnsibleDoc', function(opts)
    local ok, ansible = pcall(require, "ansible")
    if ok and ansible.display_ansible_doc then
        ansible.display_ansible_doc(opts.args)
    else
        vim.notify("ansible.nvim not available", vim.log.levels.WARN)
    end
end, { nargs = 1 })

return M
