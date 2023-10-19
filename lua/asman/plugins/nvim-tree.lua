-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

local api = require('nvim-tree.api')

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
	update_focused_file = {
		enable = true,
	},
})

local devicons = require("nvim-web-devicons")
devicons.set_icon {
  [".nvmrc"] = {
    icon = "",
    color = "#E8274B",
    cterm_color = "197",
    name = "NVMrc",
  }
}

devicons.set_icon {
  [".node-version"] = {
    icon = "",
    color = "#68A063",
    name = "Codeowners",
  }
}

devicons.set_icon {
  [".eslintignore"] = {
    icon = "",
    color = "#2656c7",
    name = "eslint",
  }
}

devicons.set_icon {
  [".eslintrc"] = {
    icon = "",
    color = "#2656c7",
    name = "eslint",
  }
}

devicons.set_icon {
  [".editorconfig"] = {
    icon = "",
    color = "#808080",
    name = "editorconfig",
  }
}

local function opts(desc)
    return {
      desc = 'nvim-tree: ' .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
  }
end

vim.keymap.set('n', '<leader>\'',   api.tree.change_root_to_node,        opts('CD'))
