return {
	"hat0uma/csvview.nvim",
	---@module "csvview"
    ---@type CsvView.Options
    lazy = false,
    opts = {
		parser = { comments = { "#", "//" } },
		keymaps = {
			-- Text objects for selecting fields
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			-- Excel-like navigation:
			-- Use <Tab> and <S-Tab> to move horizontally between fields.
			-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
			-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
			jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
			jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
			jump_next_row = { "<Enter>", mode = { "n", "v" } },
			jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		},
		view = {
			display_mode = "border",
		},
	},
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    -- Load at startup and enable CsvView for every buffer when it's opened.
    -- This makes CsvView active across the workspace automatically.
    config = function(_, opts)
        local ok, csvview = pcall(require, "csvview")
        if ok and csvview.setup then
            csvview.setup(opts)
        end

        -- Enable CsvView only for buffers whose filetype is 'csv'.
        vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWinEnter", "FileType" }, {
            pattern = "*",
            callback = function()
                local ft = vim.bo.filetype
                if ft == "csv" or ft == "tsv" then
                    pcall(vim.cmd, "CsvViewEnable")
                end
            end,
        })
    end,
}
