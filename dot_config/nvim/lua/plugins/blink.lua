return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = { preset = 'default' },
            appearance = { nerd_font_variant = 'mono' },
            completion = { documentation = { auto_show = false } },
            sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup({
                ui = { border = 'rounded' },
                registries = {
                    'github:mason-org/mason-registry',
                    'github:Crashdummyy/mason-registry'
                }
            })
        end
    },
    {
        'seblyng/roslyn.nvim',
        ft = 'cs',
        opts = {
            config = {
                settings = {
                    ['csharp|code_lens'] = {
                        dotnet_enable_references_code_lens = true,
                    },
                    ['csharp|completion'] = {
                        dotnet_provide_regex_completions = true,
                    },
                    ['csharp|inlay_hints'] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                        csharp_enable_inlay_hints_for_types = true,
                        dotnet_enable_inlay_hints_for_indexer_parameters = true,
                        dotnet_enable_inlay_hints_for_literal_parameters = true,
                        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                        dotnet_enable_inlay_hints_for_other_parameters = true,
                        dotnet_enable_inlay_hints_for_parameters = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                        dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                    }
                }
            }
        }
    },
}
