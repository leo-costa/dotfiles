return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = {},
        explorer = { replace_netrw = true },
        input = {},
        image = {},
        notifier = {},
        picker = {
            sources = {
                command_history = {
                    layout = { layout = { border = "rounded" } }
                },
                explorer = {
                    layout = { layout = { position = "right" } }
                }
            },
        },
        statuscolumn = {},
        scroll = { enabled = true },
        terminal = {},
        quickfile = {},
        words = {},
    },
    keys = {
        -- Top Pickers & Explorer
        { "<leader>,",   function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>/",   function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>:",   function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>e",   function() Snacks.explorer() end,                                       desc = "File Explorer" },
        { "<leader>t",   function() Snacks.terminal.open() end,                                  desc = "Open Terminal" },
        -- Find
        { "<leader>fc",  function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff",  function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>fg",  function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fp",  function() Snacks.picker.projects() end,                                desc = "Projects" },
        { "<leader>fr",  function() Snacks.picker.recent() end,                                  desc = "Recent" },
        -- Git
        { "<leader>gb",  function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        { "<leader>gl",  function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>gL",  function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
        { "<leader>gs",  function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS",  function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>gd",  function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        { "<leader>gf",  function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
        { "<leader>lg",  function() Snacks.lazygit.open() end,                                   desc = "Open LazyGit" },
        { "<leader>gbo", function() Snacks.gitbrowse.open() end,                                 desc = "Git Browse Open" },
        -- Search
        { "<leader>sd",  function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
        { "<leader>sm",  function() Snacks.picker.marks() end,                                   desc = "Marks" },
        { "<leader>sn",  function() Snacks.picker.notifications() end,                           desc = "Notification History" },
        { "<leader>sr",  function() Snacks.picker.registers() end,                               desc = "Registers" },
        { "<leader>sq",  function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
        -- Grep
        { "<leader>sb",  function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>sB",  function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
        { "<leader>sw",  function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
        -- LSP
        { "gd",          function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",          function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",          function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
        { "gI",          function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gy",          function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "<leader>ss",  function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>sS",  function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    }
}
