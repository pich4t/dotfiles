local autocmd = vim.api.nvim_create_autocmd

-- Make the backgroud transparent
autocmd('ColorScheme', {
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
    end,
})
vim.cmd.colorscheme('default')

-- Don't continue comment leaders on <Enter> (r) or o/O (o).
-- Runtime ftplugins add "cro" per buffer, so this has to be buffer-local.
autocmd('FileType', {
    callback = function()
        vim.opt_local.formatoptions:remove({ 'r', 'o' })
    end,
})
