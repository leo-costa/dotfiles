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
                options = {
                    section_separators = '',
                    component_separators = '|'
                },
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
                    'html',
                    'go',
                    'json',
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
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end)
                    map('n', '<leader>hB', gitsigns.blame)
                    map('n', '<leader>hd', gitsigns.diffthis)
                    map('n', '<leader>hq', gitsigns.setqflist)
                    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
                    map('n', '<leader>hp', gitsigns.preview_hunk)

                    -- Toggles
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>tw', gitsigns.toggle_word_diff)
                end
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
