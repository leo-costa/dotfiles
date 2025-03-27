return {
    cmd = { vim.fn.stdpath('data') .. '/mason/bin/gopls' },
    root_markers = { 'go.mod', 'go.work' },
    filetypes = { 'go' },
    single_file_support = true,
}
