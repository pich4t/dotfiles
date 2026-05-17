-- Diagnostic config
vim.diagnostic.config({
    float = {
        border = 'rounded',
        title = 'Diagnostics',
        header = '',
        suffix = ''
    },
    severity_sort = true
})
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics' })

-- LSP buffer keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end
})

