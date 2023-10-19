-- Utilities for creating configurations
local util = require("formatter.util")
local keymap = vim.keymap -- for conciseness

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		css = {
			function()
				return {
					exe = "stylelint",
					try_node_modules = true,
          args = {"--fix", "customSyntax"},
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

keymap.set("n", "<leader>f", ":Format<CR>")
keymap.set("n", "<leader>F", ":FormatWrite<CR>")
