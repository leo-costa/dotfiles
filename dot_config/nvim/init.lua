vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.opt.cursorline = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
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

-- Basic remapping
vim.keymap.set('n', '<leader>w', '<Esc>:w<CR>')

-- Move selection while on visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Toggle inlay hints
vim.keymap.set('n', '<leader>h', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- Add borders to both diagnostic and lsp hover
vim.diagnostic.config({
    float = { border = "single" }
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = "single" }
)

-- Show highlight when yanking
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Create LSP progress
vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), "info", {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
          or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- Lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', lazyrepo, '--branch=stable', lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins', {
    ui = { border = "single" }
})
