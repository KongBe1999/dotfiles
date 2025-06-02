return {
	{ "github/copilot.vim" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim" }, -- for curl, log and async functions
			{ "nvim-telescope/telescope.nvim" }, -- for the telescope picker
			{ "nvim-telescope/telescope-ui-select.nvim" }, -- for the telescope picker
			{ "nvim-treesitter/nvim-treesitter" }, -- for parsing code
			{ "MunifTanjim/nui.nvim" }, -- for the floating window
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			mappings = {
				complete = {
					insert = "<C>-<Tab>", -- I don't know how it works, but it does, now Tab actually do its job
				},
				close = {
					normal = "q",
					insert = "q",
				},
				reset = {
					normal = "<C-c>",
					insert = "<C-c>",
				},
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
			},
			window = {
				layout = "vertical",
				width = 0.3,
				height = 0.3,
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
		keys = {
			{ "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
			{ "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
			{ "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
			{ "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues" },
			{ "<leader>zo", ":CopilotChatOptimizer<CR>", mode = "v", desc = "Optimize Code" },
			{ "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
			{ "<leader>zt", ":CopilotChatTest<CR>", mode = "v", desc = "Generate Test" },
			{ "<leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
			{ "<leader>zs", ":CopilotChatCommit<CR>", mode = "v", desc = "Genrate Commit for Selection" },
			{ "<leader>zz", ":CopilotChatToggle<CR>", mode = "n", desc = "Toggle Copilot Chat" },
		},
	},
}
