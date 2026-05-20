local parsers = {
	"bash",
	"cmake",
	"css",
	"dockerfile",
	"gitignore",
	"graphql",
	"groovy",
	"html",
	"java",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"proto",
	"python",
	"query",
	"regex",
	"sql",
	"terraform",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

local filetypes = {
	"bash",
	"cmake",
	"css",
	"dockerfile",
	"gitignore",
	"graphql",
	"groovy",
	"html",
	"java",
	"javascript",
	"json",
	"lua",
	"make",
	"markdown",
	"proto",
	"python",
	"query",
	"regex",
	"sh",
	"sql",
	"terraform",
	"tf",
	"toml",
	"tsx",
	"typescript",
	"typescriptreact",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")

		treesitter.setup()
		treesitter.install(parsers, { max_jobs = 4 })

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
			pattern = filetypes,
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})
	end,
}
