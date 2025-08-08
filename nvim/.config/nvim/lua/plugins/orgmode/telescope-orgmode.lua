return {
	"nvim-orgmode/telescope-orgmode.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-orgmode/orgmode",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("orgmode")

		vim.keymap.set(
			"n",
			"<leader>ohr",
			require("telescope").extensions.orgmode.refile_heading,
			{ desc = "Refile heading orgmode" }
		)
		vim.keymap.set(
			"n",
			"<leader>ohf",
			require("telescope").extensions.orgmode.search_headings,
			{ desc = "Search headings orgmode" }
		)
		vim.keymap.set(
			"n",
			"<leader>oil",
			require("telescope").extensions.orgmode.insert_link,
			{ desc = "Insert link orgmode" }
		)
	end,
}
