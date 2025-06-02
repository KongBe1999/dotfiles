return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		-- Will use Telescope if installed or a vim.ui.select picker otherwise
		{ "<leader>as", "<cmd>SessionSearch<CR>",         desc = "Session search" },
		{ "<leader>aw", "<cmd>SessionSave<CR>",           desc = "Save session" },
		{ "<leader>aa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
	},

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		-- root_dir = vim.fn.stdpath("data") .. "/sessions/",
		show_auto_restore_notif = true, -- Show notification when restoring a session
		-- enabled = true,           -- Enable auto-session
		-- auto_restore_last_session = function()
		-- 	if vim.fn.argc() > 0 then
		-- 		print("Files were passed as arguments, not restoring last session")
		-- 		return false
		-- 	else
		-- 		print("Restoring last session")
		-- 		return true
		-- 	end
		-- end,
		auto_restore_last_session = true, -- Automatically restore last session on startup
		pre_cwd_changed_cmds = {
			"Neotree close",        -- Close Neotree before saving session
		},
		post_cwd_changed_cmds = {
			function()
				require("lualine").refresh() -- example refreshing the lualine status line _after_ the cwd changes
			end,
		},
		-- ⚠️ This will only work if Telescope.nvim is installed
		-- The following are already the default values, no need to provide them if these are already the settings you want.
		session_lens = {
			-- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
			load_on_setup = true,
			previewer = false,
			mappings = {
				-- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
				delete_session = { "i", "<C-D>" },
				alternate_session = { "i", "<C-S>" },
				copy_session = { "i", "<C-Y>" },
			},
			-- Can also set some Telescope picker options
			-- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
			theme_conf = {
				border = true,
				-- layout_config = {
				--   width = 0.8, -- Can set width and height as percent of window
				--   height = 0.5,
				-- },
			},
		},
	},
}
