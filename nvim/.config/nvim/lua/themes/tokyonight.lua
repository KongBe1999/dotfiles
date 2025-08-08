return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},

	config = function()
		require("tokyonight").setup({
			stype = "night",
		})
		vim.cmd([[colorscheme tokyonight-storm]])
	end,
}
