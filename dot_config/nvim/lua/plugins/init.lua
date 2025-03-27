return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                transparent_background = true,
                styles = {
                    conditionals = {},
                },
                integrations = {
                    mason = true,
                    nvim_surround = true,
                }
            })

            vim.cmd('colorscheme catppuccin-mocha')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup({
                options = { theme = 'catppuccin' },
                extensions = { 'lazy', 'mason' },
            })
        end
    },
    {
        'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        config = function()
            require('nvim-surround').setup({})
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                auto_install = false,
                ensure_installed = {
                    'json',
                    'html',
                    'markdown',
                    'markdown_inline',
                    'toml',
                    'vim',
                    'vimdoc'
                },
                ignore_install = { 'all' },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                modules = {}
            })
        end
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
                { path = 'LazyVim',            words = { 'LazyVim' } },
                { path = 'lazy.nvim',          words = { 'LazyVim' } },
            }
        }
    }
}
