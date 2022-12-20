-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.DEBUG,
	-- All formatter configurations are opt-in
	filetype = {
		typescript = {
			require("formatter.filetypes.typescript").eslint_d
		},
		javascript = {
			require("formatter.filetypes.typescript").eslint_d
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
