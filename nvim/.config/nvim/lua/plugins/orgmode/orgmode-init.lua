local plugins = {
	require("plugins.orgmode.org-bullets"),
	require("plugins.orgmode.telescope-orgmode"),
	require("plugins.orgmode.org-roam"),
}

return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		-- dependencies = { "saghen/blink.cmp" },
		ft = { "org" },
		config = function()
			local Menu = require("plugins.orgmode.orgmode-menu")
			-- Setup orgmode
			require("orgmode").setup({
				org_agenda_files = "~/orgfiles/**/*",
				org_default_notes_file = "~/orgfiles/refile.org",
				ui = {
					menu = {
						handler = function(data)
							Menu:new({
								window = {
									margin = { 1, 0, 1, 0 },
									padding = { 0, 1, 0, 1 },
									title_pos = "center",
									border = "single",
									zindex = 1000,
								},
								icons = {
									separator = "➜",
								},
							}):open(data)
						end,
					},
				},
				mappings = {
					org = {
						org_toggle_checkbox = "<C-d>",
					},
				},
			})

			-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
			-- add ~org~ to ignore_install
			-- require("nvim-treesitter.configs").setup({
			-- 	ensure_installed = "all",
			-- 	ignore_install = { "org" },
			-- })
		end,
	},
	plugins,
}
