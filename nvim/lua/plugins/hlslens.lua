return {
    'kevinhwang91/nvim-hlslens',
    event = 'VeryLazy',
    opts = {},
    keys = {
        { 'n', function()
            vim.cmd('normal! ' .. vim.v.count1 .. 'n')
            require('hlslens').start()
        end, desc = 'Next search match' },
        { 'N', function()
            vim.cmd('normal! ' .. vim.v.count1 .. 'N')
            require('hlslens').start()
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
