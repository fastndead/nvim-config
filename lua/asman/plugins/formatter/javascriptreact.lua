local M = {}

local defaults = require "formatter.defaults"
local util = require "formatter.util"

M.jsbeautify = util.copyf(defaults.jsbeautify)

M.prettydiff = util.withl(defaults.prettydiff, "javascript")

M.esformatter = util.copyf(defaults.esformatter)

M.prettier = util.copyf(defaults.prettier)

M.prettierd = util.copyf(defaults.prettierd)

M.prettiereslint = util.copyf(defaults.prettiereslint)

M.eslint_d = function()
  return {
    exe = "eslint_d",
    args = {
      "--stdin",
      "--stdin-filename",
      util.escape_path(util.get_current_buffer_file_path()),
      "--fix-to-stdout",
    },
    stdin = true,
    try_node_modules = true,
  }
end

M.standard = util.copyf(defaults.standard)

M.denofmt = util.copyf(defaults.denofmt)

M.semistandard = util.copyf(defaults.semistandard)

M.clangformat = util.copyf(defaults.clangformat)

return M
