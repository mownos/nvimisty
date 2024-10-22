local special_icons = require("plugins.configs.neotree-configs.special-icons")
local highlights = require("neo-tree.ui.highlights")
local mini_icons = require("mini.icons")

require("neo-tree").setup({
	retain_hidden_root_indent = true,
	hide_root_node = true,
	close_if_last_window = true,
	enable_git_status = true,
	-- source_selector = {
	-- 	separator = { right = "", left = "" },
	-- 	separator_active = nil,
	-- 	show_separator_on_edge = false,
	-- 	winbar = true,
	-- },
	default_component_configs = {
		icon = {
			folder_closed = "󰉋",
			folder_open = "󰝰",
			folder_empty = "",
		},
		indent = {
			with_expanders = true,
			with_markers = false,
			expander_collapsed = "",
			expander_highlight = "NeoTreeExpander",
			expander_expanded = "",
		},
		git_status = {
			symbols = {
				added = "󰬈",
				modified = "󰬔",
				deleted = "󰬋",
				renamed = "󰬙",
				-- Status type
				untracked = "UN",
				ignored = "󰬐",
				unstaged = "󰬜",
				staged = "󰬚",
				conflict = "󰬊",
			},
		},
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		follow_current_file = {
			enabled = true,
		},
		components = {
			icon = function(config, node, state)
				local icon = config.default or " "
				local padding = config.padding or " "
				local highlight = config.highlight or highlights.FILE_ICON

				if node.type == "directory" then
					local mini_directory_icon, hl = mini_icons.get("directory", node.name)
					local parsed_special_icons = special_icons[node.name]
						or {
							open = mini_directory_icon or config.folder_open or "-",
							closed = mini_directory_icon or config.folder_closed or "+",
							highlight = hl,
						}

					highlight = parsed_special_icons.highlight or highlights.DIRECTORY_ICON

					if node:is_expanded() then
						icon = parsed_special_icons.open
					else
						icon = parsed_special_icons.closed
					end
				elseif node.type == "file" then
					-- Use mini.icons for render file icons
					-- local success, mini_icons = pcall(require, "mini.icons")
					local devicon, hl = mini_icons.get("file", node.name)

					icon = devicon or icon
					highlight = hl or highlight
				end

				return {
					text = icon .. padding,
					highlight = highlight,
				}
			end,
		},
	},
})
