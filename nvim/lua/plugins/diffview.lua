return {
    'sindrets/diffview.nvim',
    keys = {
        { '<Leader>gd', '<Cmd>DiffviewOpen<CR>', desc = 'Open diff view' },
        { '<Leader>gh', '<Cmd>DiffviewFileHistory %<CR>', desc = 'File history' },
        { '<Leader>gc', '<Cmd>DiffviewClose<CR>', desc = 'Close diff view' },
    },
    opts = {}
}
