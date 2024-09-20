return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
        vim.keymap.set('n', '<leader>ft', builtin.lsp_dynamic_workspace_symbols, {})

        vim.keymap.set('n', '<leader>nf', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[N]eovim [F]iles' })
    end
}
