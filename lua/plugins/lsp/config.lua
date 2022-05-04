local ok, lsp_config = pcall(require, "lspconfig")

if not ok then
    return
end

local lsp_installer = require "nvim-lsp-installer"
local utils = require "utils"

local on_attach = function(client, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    local is_null_ls = client.name == "null-ls"
    client.resolved_capabilities.document_formatting = is_null_ls
    client.resolved_capabilities.document_range_formatting = is_null_ls
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 0,
        },
        capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
    }

    if server.name == "sumneko_lua" then
        opts.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                    disable = {
                        "lowercase-global",
                        "undefined-global",
                        "unused-local",
                        "unused-function",
                        "unused-vararg",
                        "trailing-space",
                    },
                },
            },
        }
    end

    if server.name == "emmet_ls" then
        opts.root_dir = function(fname)
            return vim.loop.cwd()
        end
    end

    server:setup(opts)
end)

-- Gutter sign icons
for type, icon in pairs(utils.signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Diagnostics icons right side of code
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        spacing = 6,
        prefix = " ",
    },
    signs = true,
    underline = false,
    update_in_insert = false,
})
