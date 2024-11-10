return {
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
                fidget = true,
                mason = true,
                nvim_surround = true,
            }
        })

        vim.cmd('colorscheme catppuccin-mocha')
    end
}
