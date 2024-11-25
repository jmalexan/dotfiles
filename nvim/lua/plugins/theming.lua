return {
	-- {
	-- 	"f-person/auto-dark-mode.nvim",
	-- 	dependencies = {
	-- 		"navarasu/onedark.nvim",
	-- 		"akinsho/bufferline.nvim",
	-- 		"nvim-lualine/lualine.nvim",
	-- 	},
	-- 	opts = {
	-- 		update_interval = 1000,
	-- 	},
	-- },
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
		},
		config = function(_, opts)
			require("onedark").setup(opts)
			-- vim.api.nvim_set_option_value("background", "light", {})
			require("onedark").load()
		end,
	},
}
