return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				html = { "eslint_d" },
				-- css = { "eslint_d" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				python = { "pylint" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})

			require("lint").linters.pylint.cmd = "python"
			require("lint").linters.pylint.args = {
				"-m",
				"pylint",
				"-f",
				"json",
				"--from-stdin",
				function()
					return vim.api.nvim_buf_get_name(0)
				end,
			}
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-lint",
		},
		opts = {},
	},
}
