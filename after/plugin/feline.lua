local vi_mode_utils = require('feline.providers.vi_mode')

-- local M = {
--     active = {{}, {}, {}},
--     inactive = {{}, {}, {}},
-- }

local M = {
    active = {},
    inactive = {}
}

table.insert(M.active, {})
table.insert(M.active, {})

table.insert(M.inactive, {})
table.insert(M.inactive, {})

M.active[1] = {
    {
        provider = '▊ ',
        hl = {
            fg = 'skyblue',
        },
    },
    {
        provider = 'vi_mode',
        hl = function()
            return {
                name = vi_mode_utils.get_mode_highlight_name(),
                bg = vi_mode_utils.get_mode_color(),
                fg = 'bg',
                style = 'bold',
            }
        end,
        icon='',
        right_sep = 'slant_right',
    },
    {},
}

-- M.active[2] = {
--     {
--         provider = 'right',
--         hl = {
--             fg = 'skyblue',
--         },
--     },
-- }

-- local u = require("../../utils/statusline")
require('feline').setup({
    default_fg = "#ebdbb2",
    default_bg = "#3c3836",
    colors = {
        fore = "#504945",
        back = "#928374",
        dark = "#282828",
        white = "#fbf1c7",
        skyblue = "#458588",
        cyan = "#89b482",
        green = "#b8bb26",
        oceanblue = "#83a598",
        magenta = "#c14a4a",
        orange = "#d65d0e",
        red = "#ea6962",
        violet = "#d3869b",
        yellow = "#fabd2f"
        },
        vi_mode_colors = {
            NORMAL = "back",
            OP = "cyan",
            INSERT = "skyblue",
            VISUAL = "cyan",
            BLOCK = "cyan",
            REPLACE = "yellow",
            ["V-REPLACE"] = "yellow",
            ENTER = "cyan",
            MORE = "cyan",
            SELECT = "magenta",
            COMMAND = "orange",
            SHELL = "skyblue",
            TERM = "skyblue",
            NONE = "orange"
        },
        -- components = M
        --components = {
        --    ----------
        --    -- Left --
        --    ----------
        --    left = {
        --        active = {
        --            {
        --                provider = u.mode,
        --                hl = function()
        --                    return {
        --                        name = u.vi_mode_utils.get_mode_highlight_name(),
        --                        fg = "bg",
        --                        bg = u.vi_mode_utils.get_mode_color(),
        --                        style = "bold"
        --                    }
        --                end,
        --                right_sep = {str = u.icons.slant_right}
        --            },
        --            {
        --                provider = "file_info",
        --                file_modified_icon = "",
        --                hl = {style = "bold", fg = "oceanblue"},
        --                left_sep = " ",
        --                right_sep = function()
        --                    local val = {hl = {fg = "bg"}}
        --                    if u.b.gitsigns_status_dict then
        --                        val.str = ""
        --                    else
        --                        val.str = u.icons.slant_right_2
        --                    end

        --                    return val
        --                end
        --            },
        --            {
        --                provider = u.icons.locker,
        --                hl = {fg = "red"},
        --                enabled = function()
        --                    return vim.bo.readonly
        --                end
        --            },
        --            {
        --                provider = "git_branch",
        --                icon = "  ",
        --                hl = {fg = "white", bg = "dark", style = "bold"},
        --                left_sep = function()
        --                    local val = {hl = {fg = "bg", bg = "dark"}}
        --                    if u.b.gitsigns_status_dict then
        --                        val.str = u.icons.slant_right_2
        --                    else
        --                        val.str = ""
        --                    end

        --                    return val
        --                end
        --            },
        --            {
        --                provider = "git_diff_added",
        --                icon = " +",
        --                hl = {
        --                    fg = "cyan",
        --                    bg = "dark",
        --                    style = "bold"
        --                }
        --            },
        --            {
        --                provider = "git_diff_changed",
        --                icon = " ~",
        --                hl = {
        --                    fg = "yellow",
        --                    bg = "dark",
        --                    style = "bold"
        --                }
        --            },
        --            {
        --                provider = "git_diff_removed",
        --                icon = " -",
        --                hl = {
        --                    fg = "red",
        --                    bg = "dark",
        --                    style = "bold"
        --                },
        --                right_sep = function()
        --                    local val = {hl = {fg = "dark", bg = "bg"}}
        --                    if u.b.gitsigns_status_dict then
        --                        val.str = u.icons.slant_right
        --                    else
        --                        val.str = ""
        --                    end

        --                    return val
        --                end
        --            }
        --        },
        --        inactive = {
        --            {
        --                provider = "file_type",
        --                hl = {
        --                    bg = "back",
        --                    fg = "bg",
        --                    style = "bold"
        --                },
        --                left_sep = {str = " ", hl = {bg = "back"}},
        --                right_sep = {
        --                    {
        --                        str = " ",
        --                        hl = {bg = "back", fg = "NONE"}
        --                    },
        --                    u.icons.slant_right
        --                }
        --            }
        --        }
        --    },
        --    mid = {active = {}, inactive = {}},
        --    -----------
        --    -- Right --
        --    -----------
        --    right = {
        --        active = {
        --            {
        --                provider = u.icons.connected,
        --                enabled = function()
        --                    return not vim.tbl_isempty(vim.lsp.buf_get_clients(0))
        --                end,
        --                hl = {fg = "#b8bb26"},
        --                right_sep = " "
        --            },
        --            {
        --                provider = function()
        --                    return u.get_diag("Error")
        --                end,
        --                hl = {fg = "bg", bg = "red", style = "bold"},
        --                left_sep = {str = "", hl = {fg = "red", bg = "bg"}},
        --                right_sep = {str = "", hl = {fg = "yellow", bg = "red"}}
        --            },
        --            {
        --                provider = function()
        --                    return u.get_diag("Warning")
        --                end,
        --                hl = {fg = "bg", bg = "yellow", style = "bold"},
        --                right_sep = {str = "", hl = {fg = "cyan", bg = "yellow"}}
        --            },
        --            {
        --                provider = function()
        --                    return u.get_diag("Information")
        --                end,
        --                hl = {fg = "bg", bg = "cyan", style = "bold"},
        --                right_sep = {str = "", hl = {fg = "oceanblue", bg = "cyan"}}
        --            },
        --            {
        --                provider = function()
        --                    return u.get_diag("Hint")
        --                end,
        --                hl = {fg = "bg", bg = "oceanblue", style = "bold"},
        --                right_sep = {str = "", hl = {fg = "bg", bg = "oceanblue"}}
        --            },
        --            u.encodign_component_slant,
        --            {
        --                provider = "file_type",
        --                hl = {bg = "fore", fg = "cyan", style = "bold"},
        --                right_sep = {str = " ", hl = {bg = "fore"}}
        --            },
        --            u.spaces_component_slant,
        --            u.position_component_slant,
        --            {
        --                provider = " " .. u.icons.page,
        --                left_sep = {str = u.icons.left, hl = {fg = "bg", bg = "back"}},
        --                right_sep = {str = " ", hl = {bg = "back"}},
        --                hl = {fg = "bg", bg = "back"}
        --            },
        --            {
        --                provider = "line_percentage",
        --                right_sep = {str = " ", hl = {bg = "back"}},
        --                hl = {
        --                    fg = "bg",
        --                    bg = "back",
        --                    style = "bold"
        --                }
        --            },
        --            {
        --                provider = "scroll_bar",
        --                hl = {
        --                    bg = "back",
        --                    fg = "yellow",
        --                    style = "bold"
        --                }
        --            }
        --        },
        --        inactive = {
        --            u.position_component_slant
        --        }
        --    }
        --},
        --properties = u.properties
})

