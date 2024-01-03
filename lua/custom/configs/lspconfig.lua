local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup{
  on_attach = function(client, buffer)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, buffer)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  settings = {
    pyright = {
      autoImportCompletion = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off'}
    }
  }
}

-- Use pyright first and then fallback to ruff-lsp
lspconfig.ruff_lsp.setup{
  on_attach = function(client, buffer)
    client.server_capabilities.hoverProvider = false
  end,
}

