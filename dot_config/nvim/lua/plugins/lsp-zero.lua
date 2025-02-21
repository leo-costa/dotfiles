return {
    {
        "seblyng/roslyn.nvim",
        ft = "cs",
        opts = { }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { 'onsails/lspkind.nvim' },              -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            local lsp_attach = function(client, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
            end

            lsp_zero.extend_lspconfig({
                capabilities = require('cmp_nvim_lsp').default_capabilities(),
                lsp_attach = lsp_attach,
                float_boarder = 'rounded',
                sign_text = true,
            })

            require('mason').setup({
                ui = { border = "single" },
                registries = {
                    'github:mason-org/mason-registry',
                    'github:Crashdummyy/mason-registry'
                }
            })

            require('mason-lspconfig').setup({
                ensure_installed = {
                    'clangd',
                    'gopls',
                    'lua_ls',
                    'rust_analyzer',
                    'zls'
                },
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                }
            })

            -- You need to setup `cmp` after lsp-zero
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            require('luasnip.loaders.from_vscode').lazy_load()

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = require('lspkind').cmp_format({
                        mode = 'symbol_text',
                        maxwidth = 50,
                        ellipsis_char = '...',
                    }),
                    expandable_indicator = true,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    -- Navigate between snippets
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

                    -- Scroll up and down on doc window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
            })
        end
    }
}
