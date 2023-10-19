local keymap = vim.keymap -- for conciseness

keymap.set('n', '<C-s>', '<cmd>lua require("my_plugin").markdown_preview()<CR>', {noremap = true})
keymap.set('n', '<M-s>', '<cmd>lua require("my_plugin").markdown_preview_stop()<CR>', {noremap = true})
keymap.set('n', '<C-p>', '<cmd>lua require("my_plugin").markdown_preview_toggle()<CR>', {noremap = true})

-- example
keymap.set('n', '<C-s>', '<Plug>MarkdownPreview', {noremap = true})
keymap.set('n', '<M-s>', '<Plug>MarkdownPreviewStop', {noremap = true})
keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', {noremap = true})
