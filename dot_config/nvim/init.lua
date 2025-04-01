vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.cursorline = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 10

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.undofile = true
vim.opt.undolevels = 100000

vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.winborder = 'rounded'

-- Basic remapping
vim.keymap.set('n', '<leader>w', '<Esc>:w<CR>')

-- Move selection while on visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Go into normal mode when on the terminal
vim.keymap.set('t', '<C-[><C-[>', '<C-\\><C-n>')

-- Toggle inlay hints
vim.keymap.set('n', '<leader>th', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- Toggle virtual text
vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.keymap.set('n', '<leader>tt', function()
    local config = vim.diagnostic.config()
    if config ~= nil then
        if config.virtual_text == false then
            vim.diagnostic.config({ virtual_text = { current_line = true } })
        else
            vim.diagnostic.config({ virtual_text = false })
        end
    end
end)

-- Toggle virtual lines
vim.keymap.set('n', '<leader>tl', function()
    local config = vim.diagnostic.config()
    if config ~= nil then
        if config.virtual_lines == false then
            vim.diagnostic.config({ virtual_lines = { current_line = true } })
        else
            vim.diagnostic.config({ virtual_lines = false })
        end
    end
end)

-- Show highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
})

-- Create LSP progress
vim.api.nvim_create_autocmd('LspProgress', {
    ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    callback = function(ev)
        local spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' }
        vim.notify(vim.lsp.status(), 'info', {
            id = 'lsp_progress',
            title = 'LSP Progress',
            opts = function(notif)
                notif.icon = ev.data.params.value.kind == 'end' and ' '
                    or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
            end,
        })
    end,
})

vim.lsp.enable({
    'clangd',
    'lua-ls',
    'gopls',
    'rust-analyzer',
    'zls'
})

-- Lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', lazyrepo, '--branch=stable', lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out,                            'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
    ui = { border = 'rounded' }
})
