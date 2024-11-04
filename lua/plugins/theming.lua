return {
	-- 	{
	-- 		"f-person/auto-dark-mode.nvim",
	-- 		dependencies = {
	-- 			"navarasu/onedark.nvim",
	-- 		},
	-- 		opts = {
	-- 			update_interval = 1000,
	-- 			set_dark_mode = function()
	-- 				vim.api.nvim_set_option_value("background", "dark", {})
	-- 				require("onedark").load()
	-- 			end,
	-- 			set_light_mode = function()
	-- 				vim.api.nvim_set_option_value("background", "light", {})
	-- 				require("onedark").load()
	-- 			end,
	-- 		},
	-- 	},
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
		},
		config = function(opts)
			require("onedark").setup(opts)
			vim.api.nvim_set_option_value("background", "light", {})
			require("onedark").load()
		end,
	},
}
