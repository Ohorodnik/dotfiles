local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.diagnostics.cspell.with({
            diagnostic_config = {
                -- see :help vim.diagnostic.config()
                underline = true,
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
            },
            diagnostics_postprocess = function(diagnostic)
                diagnostic.severity = vim.diagnostic.severity.HINT
            end,
            connfig = {
                on_success = function(cspell_config_file, params)
                    -- format the cspell config file
                    os.execute(
                        string.format(
                            "cat %s | jq -S '.words |= sort' | tee %s > /dev/null",
                            cspell_config_file,
                            cspell_config_file
                        )
                    )
                end
            }
        }),
        null_ls.builtins.code_actions.cspell,
    },
})
