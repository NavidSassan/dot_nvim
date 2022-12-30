local M = {}

M.ansible = function()
    package.loaded["ansible"] = nil
    require"ansible".example()
end

return M
