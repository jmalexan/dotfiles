return {
	"echasnovski/mini.pairs",
	{
		"m4xshen/autoclose.nvim",
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "angular", "html", "css", "javascript", "typescript", "python" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
