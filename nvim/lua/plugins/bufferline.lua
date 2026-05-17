local indicator_color = '#50fa7b'

return {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count)
                return ' ' .. count
            end,
            indicator = {
                style = 'underline'
            },
            offsets = {
                { filetype = 'NvimTree', text = 'File Explorer', text_align = 'left' }
            }
        },
        highlights = {
            buffer_selected = { italic = false, sp = indicator_color },
            hint_selected = { italic = false, sp = indicator_color },
            info_selected = { italic = false, sp = indicator_color },
            warning_selected = { italic = false, sp = indicator_color },
            error_selected = { italic = false, sp = indicator_color },
            duplicate_selected = { italic = false, sp = indicator_color },
            diagnostic_selected = { italic = false, sp = indicator_color },
            hint_diagnostic_selected = { italic = false, sp = indicator_color },
            info_diagnostic_selected = { italic = false, sp = indicator_color },
            warning_diagnostic_selected = { italic = false, sp = indicator_color },
            error_diagnostic_selected = { italic = false, sp = indicator_color },
            numbers_selected = { sp = indicator_color },
            modified_selected = { sp = indicator_color },
            pick_selected = { sp = indicator_color },
            close_button_selected = { sp = indicator_color },
            indicator_selected = { sp = indicator_color }
        }
    },
    keys = {
        { '<C-h>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
        { '<C-l>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
        { '<C-S-h>', '<Cmd>BufferLineMovePrev<CR>', desc = 'Move buffer left' },
        { '<C-S-l>', '<Cmd>BufferLineMoveNext<CR>', desc = 'Move buffer right' },
        { '<Leader>bp', '<Cmd>BufferLinePick<CR>', desc = 'Pick buffer' },
        { '<Leader>bP', '<Cmd>BufferLineTogglePin<CR>', desc = 'Pin/unpin buffer' },
        { '<Leader>bc', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Close other buffers' },
    },
    -- enabled = false
}
