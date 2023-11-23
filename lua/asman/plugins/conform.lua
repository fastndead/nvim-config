local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier", "eslint_d" },
    typescript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
    svelte = { "prettier" },
    css = { "stylelint" },
    scss = { "stylelint" },
    sass = { "stylelint" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    lua = { "stylua" },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000,
    })
  end,
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  })
end, { desc = "Format file or range (in visual mode)" })

require("conform.formatters.eslint_d").cwd = require("conform.util").root_file({
  ".eslint.js",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslint.cjs",
  ".eslint.yaml",
  ".eslint.yml",
  ".eslint.json",
})

require("conform.formatters.stylelint").cwd = require("conform.util").root_file({ ".stylelintrc" })
