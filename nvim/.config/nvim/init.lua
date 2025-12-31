require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
	require("themes.catppuccin"),
	require("plugins.neotree"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.autoformatting"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.vim-tmux-navigator"),
	require("plugins.auto-save"),
	require("plugins.copilot"),
	require("plugins.toggleterm"),
	require("plugins.repl"),
	require("plugins.auto-session"),
	-- require("plugins.luarocks"),
	-- require("plugins.image"),
	require("plugins.mini-surround"),
	require("plugins.orgmode.orgmode-init"),
	-- require("plugins.remote-nvim"),
	require("plugins.zenmode"),
	require("plugins.opencode"),
	-- require("plugins.molten"),
	-- require("plugins.jupytext"),
}

require("lazy").setup(plugins, opts)

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
	if
		msg
		and (
			msg:match("position_encoding param is required")
			or msg:match("Defaulting to position encoding of the first client")
			or msg:match("multiple different client offset_encodings")
		)
	then
		return
	end
	return notify_original(msg, ...)
end
