local none_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    none_ls.builtins.formatting.clang_format,
    none_ls.builtins.code_actions.refactoring,
    none_ls.builtins.formatting.black,
    none_ls.builtins.formatting.isort,
    none_ls.builtins.diagnostics.selene,
    none_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, buffer)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = buffer
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = buffer,
        callback = function ()
          vim.lsp.buf.format({buffer=buffer})
        end,
      })
    end
  end,
}

return opts

