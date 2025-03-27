return {
    cmd = { vim.fn.stdpath('data') .. '/mason/bin/rust-analyzer' },
    root_markers = { 'Cargo.toml' },
    filetypes = { 'rust' },
    single_file_support = true,
}
