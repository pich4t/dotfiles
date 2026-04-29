return {
    'ysmb-wtsg/in-and-out.nvim',
    keys = {
        { '<C-CR>', mode = 'i', function() require('in-and-out').in_and_out() end }
    }
}
