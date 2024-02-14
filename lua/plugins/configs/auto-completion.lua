local cmp = require("cmp")
local luasnip = require("luasnip")

vim.opt.completeopt = "menu,menuone,noselect"

local select_opts = {
	behavior = cmp.SelectBehavior.Select,
}

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
	Copilot = "",
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	sources = {
		{ name = "nvim_lsp", group_index = 2 },
		{ name = "copilot", group_index = 2 },
		{ name = "path", group_index = 2 },
		{ name = "buffer", keyword_length = 2 },
		{ name = "luasnip", group_index = 2 },
	},
	window = {
		documentation = {
			border = nil,
		},
		completion = {
			winhighlight = "Normal:CmpNormal,CursorLine:CmpCursorLine",
		},
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "[λ LSP]",
				luasnip = "[⋗ Luasnip]",
				buffer = "[Ω Buffer]",
				path = "[@ Path]",
				copilot = "[ Copilot]",
			}

			item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
			item.menu = menu_icon[entry.source.name]

			return item
		end,
	},
	mapping = {
		["<A-k>"] = cmp.mapping.select_prev_item(select_opts),
		["<A-j>"] = cmp.mapping.select_next_item(select_opts),
		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}),
		["<C-f>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-b>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if not cmp.visible() then
				fallback()
				return
			end

			if cmp.get_active_entry() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
			else
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
				cmp.select_next_item(select_opts)
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})
