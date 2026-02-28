return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			"navarasu/onedark.nvim",
			"akinsho/bufferline.nvim",
			"nvim-lualine/lualine.nvim",
		},
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				require("onedark").setup({ style = "darker" })
				vim.api.nvim_set_option_value("background", "dark", {})
				require("onedark").load()
			end,
			set_light_mode = function()
				require("onedark").setup({ style = "light" })
				vim.api.nvim_set_option_value("background", "light", {})
				require("onedark").load()
			end,
		},
		config = function(_, opts)
			-- require()
			require("auto-dark-mode").setup(opts)
		end,
	},
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
		},
		config = function(_, opts)
			-- require("onedark").setup(opts)
			-- vim.api.nvim_set_option_value("background", "light", {})
			-- require("onedark").load()
		end,
	},
}
