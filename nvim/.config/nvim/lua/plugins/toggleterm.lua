-- Keymap for toggle terminal
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm# instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local trim_spaces = true
vim.keymap.set("n", "<leader>tl", function()
	require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
end)
-- Replace with these for the other two options
vim.keymap.set("v", "<leader>tl", function()
	require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
end)

vim.keymap.set("v", "<leader>tv", function()
	require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
end)

-- For use as an operator map:
-- Send motion to terminal
vim.keymap.set("n", [[<leader><c-\>]], function()
	set_opfunc(function(motion_type)
		require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
	end)
	vim.api.nvim_feedkeys("g@", "n", false)
end)
-- Double the command to send line to terminal
vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
	set_opfunc(function(motion_type)
		require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
	end)
	vim.api.nvim_feedkeys("g@_", "n", false)
end)
-- Send whole file
vim.keymap.set("n", [[<leader><leader><c-\>]], function()
	set_opfunc(function(motion_type)
		require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
	end)
	vim.api.nvim_feedkeys("ggg@G''", "n", false)
end)

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			size = 10,
			open_mapping = [[<C-\>]],
			hide_numbers = true,
			autochdir = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			-- insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
		},
		config = function(_, opts)
			require("toggleterm").setup(opts)
		end,
	},
}
