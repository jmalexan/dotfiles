return {
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				diagnostics = "nvim_lsp",
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
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>to", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>tf", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>th", builtin.help_tags, { desc = "Telescope help tags" })

			local find_files_hijack_netrw = vim.api.nvim_create_augroup("find_files_hijack_netrw", { clear = true })
			-- clear FileExplorer appropriately to prevent netrw from launching on folders
			-- netrw may or may not be loaded before telescope-find-files
			-- conceptual credits to nvim-tree and telescope-file-browser
			vim.api.nvim_create_autocmd("VimEnter", {
				pattern = "*",
				once = true,
				callback = function()
					pcall(vim.api.nvim_clear_autocmds, { group = "FileExplorer" })
				end,
			})
			vim.api.nvim_create_autocmd("BufEnter", {
				group = find_files_hijack_netrw,
				pattern = "*",
				callback = function()
					vim.schedule(function()
						-- Early return if netrw or not a directory
						if vim.bo[0].filetype == "netrw" or vim.fn.isdirectory(vim.fn.expand("%:p")) == 0 then
							return
						end

						vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")

						require("telescope.builtin").find_files({
							cwd = vim.fn.expand("%:p:h"),
						})
					end)
				end,
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
		},
		keys = {
			{
				"<leader>d",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			default_file_explorer = false,
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			{
				"<leader>f",
				"<cmd>Oil<cr>",
				desc = "Oil",
			},
		},
	},
}
