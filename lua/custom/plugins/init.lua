-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- return {}
return {
    {
        'jghauser/fold-cycle.nvim',
        config = function()
            require('fold-cycle').setup()
        end,
    },
    {
        'theprimeagen/vim-be-good',

        dependencies = {
            'nvim-lua/plenary.nvim',
        },

        config = function() end,
    },
}
