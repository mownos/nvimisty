local special_icons = require("plugins.configs.neotree-configs.special-icons")
local highlights = require("neo-tree.ui.highlights")

require("neo-tree").setup({
	hide_root_node = true,
	close_if_last_window = true,
	enable_git_status = true,
	source_selector = {
		separator = { right = "", left = "" },
		separator_active = nil,
		show_separator_on_edge = false,
		winbar = true,
	},
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
				added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
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
					local parsed_special_icons = special_icons[node.name]
						or {
							open = config.folder_open or "-",
							closed = config.folder_closed or "+",
							highlight = highlights.DIRECTORY_ICON,
						}

					highlight = parsed_special_icons.highlight or highlights.DIRECTORY_ICON

					if node:is_expanded() then
						icon = parsed_special_icons.open
					else
						icon = parsed_special_icons.closed
					end
				elseif node.type == "file" then
					local success, web_devicons = pcall(require, "nvim-web-devicons")
					if success then
						local devicon, hl = web_devicons.get_icon(node.name, node.ext)
						icon = devicon or icon
						highlight = hl or highlight
					end
				end

				return {
					text = icon .. padding,
					highlight = highlight,
				}
			end,
		},
	},
})
