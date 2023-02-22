local jester = require("jester")
jester.setup({
	cmd = "jest -t '$result' --config /Users/asman/Desktop/admin-double/.jest/config.js --colors --verbose -- $file",
	dap = {
		runtimeArgs = {
			"--inspect-brk",
			"$path_to_jest",
			"--no-coverage",
			"--config",
			"/Users/asman/Desktop/admin-platform/.jest/config.js",
			"-t",
			"$result",
			"--",
			"$file",
		},
	},
})

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>rt", function()
  local currentBufPath = vim.api.nvim_buf_get_name(0)
	local rootPath = require("lspconfig").util.find_package_json_ancestor(currentBufPath)
  print(rootPath)
	jester.run({
    cmd = "jest -t '$result' --config ".. rootPath .. "/.jest/config.js --colors --verbose -- $file",
  })
end)

keymap.set("n", "<leader>dt", function()
	jester.debug()
end)
