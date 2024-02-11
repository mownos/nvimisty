local theme = require("theme/theme-colors")

-- Neotree
vim.api.nvim_set_hl(0, "NeoTreeTabInactive", { bg = theme.dark })
vim.api.nvim_set_hl(0, "NeoTreeTabActive", { bg = theme.inactive })
vim.api.nvim_set_hl(0, "NeoTreeTabSeparatorInactive", { bg = theme.dark })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#61afef" })
vim.api.nvim_set_hl(0, "NeoTreeExpander", { fg = "#c5c5c5" })
vim.api.nvim_set_hl(0, "NeotreeNormal", { bg = "#1c1f26" })
vim.api.nvim_set_hl(0, "NeotreeNormalNC", { bg = "#1c1f26" })

-- Dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#5777c6" })

-- SmoothCursor
vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#C678DD" })

-- Cmp
vim.api.nvim_set_hl(0, "CmpNormal", { bg = theme.inactive })
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
vim.api.nvim_set_hl(0, "CmpCursorLine", { fg = "#30464a", bg = "#86b695" })
-- copilot
vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

-- Git balme
vim.api.nvim_set_hl(0, "CursorLineGitBlameStatus", { bg = "#2d313b", fg = "#5c6370" })

-- Neogit
vim.api.nvim_set_hl(0, "NeogitDiffAdd", { bg = "#238957" })
vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { bg = "#238957" })
vim.api.nvim_set_hl(0, "NeogitDiffDelete", { bg = "#ae4a53" })
vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { bg = "#ae4a53" })

-- Cokeline
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "#21252b" })

-- Window separator
vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#282c34" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#1c1f26" })

-- Telescope
local base_color = "#1f2229"
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = base_color })
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = base_color, fg = base_color })
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = base_color, fg = base_color })
vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "#e590a8", fg = "#191f27" })
vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#363b44" })
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#363b44", fg = "#363b44" })
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#9dade1", fg = "#191f27" })
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = base_color, fg = base_color })

-- Edit
vim.api.nvim_set_hl(0, "MatchParen", { bg = "#6a6c71", fg = "#e5c07b", bold = true })

-- Hint
vim.api.nvim_set_hl(0, "LightBulbVirtualText", { fg = "#f5cd79", bold = true })
