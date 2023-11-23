-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- highlight everything
keymap.set("n", "<leader>a", "GVgg")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>t", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>w", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>]", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>[", ":tabp<CR>") --  go to previous tab

-- Buffers
keymap.set("n", "<Tab>", ":BufferNext<CR>")
keymap.set("n", "gn", ":bn<CR>")
keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>")
keymap.set("n", "gp", ":bp<CR>")
keymap.set("n", "<S-q>", ":BufferClose<CR>")

-- Terminal
keymap.set("t", "<esc>",  '<C-\\><C-N>', { silent = true})

----------------------
-- Plugin Keybinds
----------------------

-- fugitive
keymap.set("n", "<leader>g", ":Git<CR>") -- toggle split window maximization

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<C-t>", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>") -- find file in explorer

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

function GrepInDirectoryUnderCursor()
	local nvimTreeApi = require("nvim-tree.api")
	local currentNodeUnderCursor = nvimTreeApi.tree.get_node_under_cursor()
	if currentNodeUnderCursor == nil then
		print("Open the NvimTree, dumbass!")
		return
	end

	if currentNodeUnderCursor.type ~= "directory" then
		print("Bro, that's not a directory, you good?")
		return
	end

	vim.cmd("Telescope live_grep search_dirs=" .. currentNodeUnderCursor.absolute_path)
end

keymap.set("n", "<leader>fds", GrepInDirectoryUnderCursor) 

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
