-- Neotree
vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = "#21252b" })
vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { bg = "#21252b" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#c5c5c5" })

-- Dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#5777c6" })

-- SmoothCursor
vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#e5c07b" })

-- Cmp
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#21252b" })
-- gray
vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
-- light blue
vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
-- pink
vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
-- front
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })
-- cursorline
vim.api.nvim_set_hl(0, "CmpCursorLine", { bg = "#e5c07b" })
