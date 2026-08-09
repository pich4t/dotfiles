-- Diagnostic config
vim.diagnostic.config({
    float = {
        border = 'rounded',
        title = 'Diagnostics',
        header = '',
        suffix = '',
    },
    severity_sort = true,
})
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostics' })

-- LSP buffer keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local keyset = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
        end
        keyset('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    end,
})

-- Let lua_ls know about the 'vim' global
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
        },
    },
})
