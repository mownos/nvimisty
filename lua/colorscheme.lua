local colorscheme_name = "onedark_vivid"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme_name)

if not ok then
  vim.notify("colorscheme" .. colorscheme_name .. 'was not found!')
end

