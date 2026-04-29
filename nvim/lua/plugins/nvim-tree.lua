return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        update_focused_file = {
            enable = true,
        },
        sort = { sorter = 'case_sensitive' },
        renderer = { group_empty = true }
    },
    keys = {
        { '<Leader>E', '<Cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
        { '<Leader>e', '<Cmd>NvimTreeFocus<CR>', desc = 'Focus NvimTree' },
    }
}
