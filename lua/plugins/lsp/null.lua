local ok, null_ls = pcall(require, "null-ls")

if not ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
    sources = {
        diagnostics.hadolint,
        -- diagnostics.eslint_d,

        -- formatting.prettierd,
        -- formatting.stylua,
        formatting.gofmt,
        formatting.black,
        -- formatting.taplo,
        formatting.shfmt.with {
            filetypes = { "sh", "bash", "zsh" },
        },

        -- code_actions.eslint_d,
    },

    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
        end
    end,
}
