return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				htmlangular = { "prettier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		opts = {},
	},
}
