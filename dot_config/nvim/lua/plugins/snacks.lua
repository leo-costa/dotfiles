local cwd = vim.fn.stdpath('config')

-- Toggle floating terminal
local term_opts = {
    auto_close = true,
    win = {
        border = "rounded",
        title = " Floating Terminal ",
        title_pos = "center",
    }
}

return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        explorer = { replace_netrw = true },
        input = { enabled = true },
        image = { enabled = true },
        notifier = { enabled = true },
        picker = {
            sources = {
                command_history = {
                    layout = { layout = { border = 'rounded' } }
                },
                explorer = {
                    layout = { layout = { position = 'right' } }
                }
            },
        },
        statuscolumn = {},
        scroll = { enabled = true },
        terminal = {},
        quickfile = { enabled = true },
        words = { enabled = false },
    },
    keys = {
        -- Top Pickers & Explorer
        { '<leader>l',  function() Snacks.picker.resume() end,                       desc = 'Resume Last Picker' },
        { '<leader>,',  function() Snacks.picker.buffers() end,                      desc = 'Buffers' },
        { '<leader>/',  function() Snacks.picker.grep() end,                         desc = 'Grep' },
        { '<leader>:',  function() Snacks.picker.command_history() end,              desc = 'Command History' },
        { '<leader>e',  function() Snacks.explorer() end,                            desc = 'File Explorer' },
        { '<leader>\\', function() Snacks.terminal.open() end,                       desc = 'Open Terminal' },
        { '<leader>tf', function() Snacks.terminal.open(vim.o.shell, term_opts) end, desc = 'Open Floating Terminal' },
        -- Find
        { '<leader>fc', function() Snacks.picker.files({ cwd = cwd }) end,           desc = 'Find Config File' },
        { '<leader>ff', function() Snacks.picker.files() end,                        desc = 'Find Files' },
        { '<leader>fg', function() Snacks.picker.git_files() end,                    desc = 'Find Git Files' },
        { '<leader>fp', function() Snacks.picker.projects() end,                     desc = 'Projects' },
        { '<leader>fr', function() Snacks.picker.recent() end,                       desc = 'Recent' },
        -- Git
        { '<leader>gb', function() Snacks.picker.git_branches() end,                 desc = 'Git Branches' },
        { '<leader>gB', function() Snacks.gitbrowse.open() end,                      desc = 'Git Browse Open' },
        { '<leader>gd', function() Snacks.picker.git_diff() end,                     desc = 'Git Diff (Hunks)' },
        { '<leader>gl', function() Snacks.picker.git_log() end,                      desc = 'Git Log' },
        { '<leader>gL', function() Snacks.picker.git_log_line() end,                 desc = 'Git Log Line' },
        { '<leader>gf', function() Snacks.picker.git_log_file() end,                 desc = 'Git Log File' },
        { '<leader>gs', function() Snacks.picker.git_status() end,                   desc = 'Git Status' },
        { '<leader>gS', function() Snacks.picker.git_stash() end,                    desc = 'Git Stash' },
        { '<leader>lg', function() Snacks.lazygit.open() end,                        desc = 'Open LazyGit' },
        -- Search
        { '<leader>sd', function() Snacks.picker.diagnostics() end,                  desc = 'Diagnostics' },
        { '<leader>sm', function() Snacks.picker.marks() end,                        desc = 'Marks' },
        { '<leader>sn', function() Snacks.picker.notifications() end,                desc = 'Notification History' },
        { '<leader>sr', function() Snacks.picker.registers() end,                    desc = 'Registers' },
        { '<leader>sq', function() Snacks.picker.qflist() end,                       desc = 'Quickfix List' },
        { '<leader>sc', function() Snacks.picker.colorschemes() end,                 desc = 'Colorschemes' },
        -- Grep
        { '<leader>sb', function() Snacks.picker.lines() end,                        desc = 'Buffer Lines' },
        { '<leader>sB', function() Snacks.picker.grep_buffers() end,                 desc = 'Grep Open Buffers' },
        { '<leader>sw', function() Snacks.picker.grep_word() end,                    desc = 'Visual selection or word', mode = { 'n', 'x' } },
        -- LSP
        { 'gd',         function() Snacks.picker.lsp_definitions() end,              desc = 'Goto Definition' },
        { 'gD',         function() Snacks.picker.lsp_declarations() end,             desc = 'Goto Declaration' },
        { 'grr',        function() Snacks.picker.lsp_references() end,               nowait = true,                     desc = 'References' },
        { 'gri',        function() Snacks.picker.lsp_implementations() end,          desc = 'Goto Implementation' },
        { 'gy',         function() Snacks.picker.lsp_type_definitions() end,         desc = 'Goto T[y]pe Definition' },
        { '<leader>ds', function() Snacks.picker.lsp_symbols() end,                  desc = 'LSP Documents Symbols' },
        { '<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end,        desc = 'LSP Workspace Symbols' },
        -- Extras
        { '<leader>z',  function() Snacks.zen.zoom() end,                            desc = 'Toogle Zoom' },
        { '<leader>bd', function() Snacks.bufdelete() end,                           desc = 'Delete Buffer' },
        { '<leader>un', function() Snacks.notifier.hide() end,                       desc = 'Dismiss All Notifications' },
    }
}
