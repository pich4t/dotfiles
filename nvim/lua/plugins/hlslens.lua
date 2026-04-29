return {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
    opts = {},
    keys = {
        { 'n', function()
            local ok, _ = pcall(vim.cmd, 'normal! ' .. vim.v.count1 .. 'n')
            if ok then
                require('hlslens').start()
            end
        end, desc = 'Next search match' },
        { 'N', function()
            local ok, _ = pcall(vim.cmd, 'normal! ' .. vim.v.count1 .. 'N')
            if ok then
                require('hlslens').start()
            end
        end, desc = 'Prev search match' },
        { '*', function()
            vim.cmd('normal! *')
            require('hlslens').start()
        end, desc = 'Search word forward' },
        { '#', function()
            vim.cmd('normal! #')
            require('hlslens').start()
        end, desc = 'Search word backward' },
        { 'g*', function()
            vim.cmd('normal! g*')
            require('hlslens').start()
        end, desc = 'Search partial word forward' },
        { 'g#', function()
            vim.cmd('normal! g#')
            require('hlslens').start()
        end, desc = 'Search partial word backward' },
    },
}
