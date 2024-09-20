return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = false,
            ensure_installed = {
                'json',
                'html',
                'markdown',
                'toml',
                'vim',
                'vimdoc'
            },
            ignore_install = { 'all' },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
