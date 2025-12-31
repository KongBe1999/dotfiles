return {
	{
		"williamboman/mason.nvim",
		-- version = "v1.11.0",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			-- manually install packages that do not exist in this list please
			ensure_installed = { "lua_ls", "zls", "ts_ls", "pylsp" },
		},
	},
	{
		"saghen/blink.cmp",
		version = "v1.*",
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		lazy = false,
		config = function()
			-- Setup blink cmp for orgmode
			require("blink.cmp").setup({
				sources = {
					per_filetype = {
						org = { "orgmode" },
					},
					providers = {
						orgmode = {
							name = "Orgmode",
							module = "orgmode.org.autocompletion.blink",
							fallbacks = { "buffer" },
						},
					},
				},
			})
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- lua
			vim.lsp.config('lua_ls', {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")
			-- typescript
			vim.lsp.config('ts_ls', {
				capabilities = capabilities,
			})
			vim.lsp.enable("ts_ls")
			-- Js
			vim.lsp.config('js_ls', {
				capabilities = capabilities,
			})
			vim.lsp.enable("js_ls")
			-- yaml
			vim.lsp.config('yamlls', {
				capabilities = capabilities,
			})
			vim.lsp.enable("yamlls")
			-- golang
			vim.lsp.config('golsp', {
				capabilities = capabilities,
			})
			vim.lsp.enable("golsp")
			-- protocol buffer
			vim.lsp.config('buf_ls', { capabilities = capabilities })
			vim.lsp.enable("buf_ls")
			-- docker compose
			vim.lsp.config('docker_compose_language_service', { capabilities = capabilities })
			vim.lsp.enable("buf_ls")
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "proto",
				callback = function()
					lspconfig.buf_language_server.setup({
						capabilities = capabilities,
					})
				end,
			})
			-- python
			vim.lsp.config('pylsp', { capabilities = capabilities })
			vim.lsp.enable('pylsp')
			-- lspconfig.pyright.setup({ capabilities = capabilities })
			-- lsp kepmap setting
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			-- list all methods in a file
			-- working with go confirmed, don't know about other, keep changing as necessary
			vim.keymap.set("n", "<leader>fm", function()
				local filetype = vim.bo.filetype
				local symbols_map = {
					python = "function",
					javascript = "function",
					typescript = "function",
					java = "class",
					lua = "function",
					go = { "method", "struct", "interface" },
				}
				local symbols = symbols_map[filetype] or "function"
				require("fzf-lua").lsp_document_symbols({ symbols = symbols })
			end, {})
		end,
	},
}
