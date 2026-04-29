return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim'
    },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<C-j>'] = require('telescope.actions').move_selection_next,
                    ['<C-k>'] = require('telescope.actions').move_selection_previous,
                    ['<Esc>'] = require('telescope.actions').close
                }
            }
        }
    },
    keys = {
        { '<Leader>ff', '<Cmd>Telescope find_files<CR>', desc = 'Find files' },
        { '<Leader>fg', '<Cmd>Telescope live_grep<CR>', desc = 'Live grep' },
        { '<Leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Buffers' },
        { '<Leader>fh', '<Cmd>Telescope help_tags<CR>', desc = 'Help tags' },
        { '<Leader>fc', '<Cmd>Telescope colorscheme enable_preview=true<CR>', desc = 'Colorscheme' }
    }
}
