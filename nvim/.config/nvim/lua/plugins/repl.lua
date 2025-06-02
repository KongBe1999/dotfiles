return {
	{
		"pappasam/nvim-repl",
		lazy = true,
		opts = {
			--     filetype_commands = {
			--         python = { cmd = "python", repl = "ipython" },
			--     },
			-- default = { cmd = "zsh", filepath = "zsh" },
			-- open_window_default = "hor",
		},
		keys = {
			{ "<S-CR>", "<Plug>(ReplSendCell)", mode = "n", desc = "Send Repl Cell" },
			{ "<S-l>", "<Plug>(ReplSendLine)", mode = "n", desc = "Send Repl Line" },
			{ "<S-v>", "<Plug>(ReplSendVisual)", mode = "x", desc = "Send Repl Visual Selection" },
		},
	},
}
