return {
    { 'tpope/vim-fugitive' },
    {
        'j-hui/fidget.nvim',
        opts = {}
    },
    {
        'mrjones2014/smart-splits.nvim',
        lazy = false,
        config = function()
            vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
            vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
            vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
            vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
            vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

            vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
        end
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('oil').setup({
                keymaps = {
                    ['<C-h>'] = false,
                    ['<C-s>'] = false,
                    ['<C-l>'] = false,
                    ['<C-t>'] = false,
                },
                watch_for_changes = true
            })
        end
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = "luvit-meta/library", words = { "vim%.uv" } },
                { path = "LazyVim",            words = { "LazyVim" } },
                { path = "lazy.nvim",          words = { "LazyVim" } },
                { path = 'wezterm-types',      mods = { 'wezterm' } }
            }
        }
    }
}
