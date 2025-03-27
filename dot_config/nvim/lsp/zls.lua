return {
    cmd = { vim.fn.stdpath('data') .. '/mason/bin/zls' },
    root_markers = { 'build.zig', 'build.zig.zon' },
    filetypes = { 'zig' },
    single_file_support = true,
}
