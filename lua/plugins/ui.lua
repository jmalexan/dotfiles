return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "right_align",
					glyphs = {
						git = {
							unstaged = "U",
							staged = "S",
							unmerged = "!",
							untracked = "N",
						},
					},
				},
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						separator = true,
					},
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				theme = "onedark",
				disabled_filetypes = { "NvimTree" },
			},
		},
	},
}
