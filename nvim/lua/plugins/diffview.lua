return {
    'sindrets/diffview.nvim',
    opts = function()
        local actions = require('diffview.actions')
        return {
            keymaps = {
                file_panel = {
                    { 'n', '<CR>', actions.focus_entry, { desc = 'Open the diff and focus it' } },
                },
            },
        }
    end,
    keys = {
        { '<Leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Open diff view' },
        { '<Leader>gh', '<Cmd>DiffviewFileHistory %<CR>', desc = 'File history' },
        { '<Leader>gc', '<Cmd>DiffviewClose<CR>', desc = 'Close diff view' },
    },
}
