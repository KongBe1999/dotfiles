return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
			-- port = 3000,
			-- provider = {
			-- 	cmd = "OPENCODE_CONFIG=~/.config/opencode/opencode.json opencode",
			-- },
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true

		-- Recommended/example keymaps.
		vim.keymap.set("", "<leader>za", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "Ask opencode" })
		vim.keymap.set({ "n", "v", "x" }, "<leader>zx", function()
			require("opencode").select()
		end, { desc = "Execute opencode action…" })

		vim.keymap.set({ "n", "t" }, "<leader>zz", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })

		vim.keymap.set({ "n", "t" }, "<leader>zt", function()
			require("opencode").start()
		end, { desc = "Start opencode" })

		vim.keymap.set({ "n", "x" }, "go", function()
			return require("opencode").operator("@this ")
		end, { expr = true, desc = "Add range to opencode" })
		vim.keymap.set("n", "goo", function()
			return require("opencode").operator("@this ") .. "_"
		end, { expr = true, desc = "Add line to opencode" })

		vim.keymap.set("n", "<leader>zu", function()
			require("opencode").command("session.half.page.up")
		end, { desc = "opencode half page up" })
		vim.keymap.set("n", "<leader>zd", function()
			require("opencode").command("session.half.page.down")
		end, { desc = "opencode half page down" })

		-- Map ESC in terminal mode to close OpenCode instead of exiting to normal mode
		-- Disable ESC from exiting terminal-mode and entering normal mode
		-- ESC does nothing in all terminal buffers
		vim.keymap.set("t", "<Esc>", "<Nop>", { desc = "Disable ESC in terminal mode" })

		-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o".
		vim.keymap.set("n", "+", "<C-a>", { desc = "Increment", noremap = true })
		vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement", noremap = true })
	end,
}
