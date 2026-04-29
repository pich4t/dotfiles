return {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
        on_attach = function(bufnr)
            local gs = require('gitsigns')
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map('n', ']c', function() gs.nav_hunk('next') end, 'Next hunk')
            map('n', '[c', function() gs.nav_hunk('prev') end, 'Prev hunk')
            -- Actuions
            map('n', '<Leader>gp', gs.preview_hunk_inline, 'Preview hunk')
            map('n', '<Leader>gr', gs.reset_hunk, 'Reset hunk')
            map('n', '<Leader>gs', gs.stage_hunk, 'Stage hunk')
            map('n', '<Leader>gu', gs.undo_stage_hunk, 'Undo stage hunk')
            map('n', '<Leader>gb', gs.blame_line, 'Blame line')
        end
    }
}
