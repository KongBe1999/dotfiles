local plugins = {
	require("plugins.orgmode.org-bullets"),
	require("plugins.orgmode.telescope-orgmode"),
	require("plugins.orgmode.org-roam"),
}

return {
	{
		"nvim-orgmode/orgmode",
		event = "VeryLazy",
		dependencies = { "rcarriga/nvim-notify" },
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
				notifications = {
					enabled = true,
					cron_enabled = false,
					repeater_reminder_time = true,
					deadline_warning_reminder_time = { 30, 60, 120, 240 },
					reminder_time = { 30, 60, 120, 240 },
					deadline_reminder = true,
					scheduled_reminder = true,
					org_priority_hightest = "high",
					org_priority_lowest = "low",
					org_priority_default = "medium",
					notifier = function(tasks)
						for _, task in ipairs(tasks) do
							local title = string.format("%s %s", task.todo, task.title)
							local date = string.format("%s: %s", task.type, task.time:to_string())

							local notify = require("notify")
							notify(date, vim.log.levels.INFO, {
								title = title,
								timeout = 10000,
							})

							-- Example: if you use Snacks, you can do something like this (THis is not implemented)
							-- Snacks.notifier.notify(table.concat(result, "\n"), vim.log.levels.INFO, {
							-- 	title = "Orgmode",
							-- 	ft = "org",
							-- })
						end
					end,
					cron_notifier = function(tasks)
						for _, task in ipairs(tasks) do
							local title = string.format("%s (%s)", task.category, task.humanized_duration)
							local subtitle =
								string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title)

							local date = string.format("%s: %s", task.type, task.time:to_string())

							local notify = require("notify")
							notify(string.format("%s\n%s\n%s", title, subtitle, date), vim.log.levels.INFO, {
								title = "Orgmode",
								timeout = 5000,
								render = "minimal",
								-- icon = "",
							})
							-- -- Linux
							-- if vim.fn.executable("notify-send") == 1 then
							-- 	vim.system({
							-- 		"notify-send",
							-- 		-- "--icon=/path/to/orgmode/assets/nvim-orgmode-small.png",
							-- 		"--app-name=orgmode",
							-- 		title,
							-- 		string.format("%s\n%s", subtitle, date),
							-- 	})
							-- end
							--
							-- -- MacOS
							-- if vim.fn.executable("terminal-notifier") == 1 then
							-- 	vim.system({
							-- 		"terminal-notifier",
							-- 		"-title",
							-- 		title,
							-- 		"-subtitle",
							-- 		subtitle,
							-- 		"-message",
							-- 		date,
							-- 	})
							-- end
						end
					end,
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
