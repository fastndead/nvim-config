local format_and_lint_augroup = vim.api.nvim_create_augroup("format_and_lint", { clear = true })

local autocmds = {
  format_and_lint_augroup
}

return autocmds
