local M = {}

M.ansible = function()
    package.loaded["ansible"] = nil
    local ok, ansible = pcall(require, "ansible")
    if ok and ansible.example then
        ansible.example()
    else
        vim.notify("ansible.nvim not available", vim.log.levels.WARN)
    end
end

return M
