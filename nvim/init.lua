-- Make sure to setup leader key before loading any config files so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('config.keymaps')
require('config.lazy')
require('config.options')
