local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  },
}

M.copilot = {
  plugin = true,
  i = {
    ["<C-j>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Accept copilot suggestion",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.telescope_extra = {
  n = {
    ["<leader>fS"] = {
      function()
        local telescope_builtin = require "telescope.builtin"
        telescope_builtin.lsp_dynamic_workspace_symbols {
          path_display = function(_, path)
            return vim.fn.fnamemodify(path, ":p:~:.")
          end,
        }
      end,
      "Find Workspace Symbols Custom",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
    ["<leader>fs"] = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
      "Find Workspace Symbols",
    },
    ["<leader>fd"] = {
      "<cmd>Telescope diagnostics<CR>",
      "Find Diagnostics",
    },
    ["<leader>fc"] = {
      "Telescope command_history<CR>",
      "Find Command History",
    },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>tw"] = {
      "<cmd>TroubleToggle workspace_diagnostics<CR>",
      "Toggle Workspace Diagnostics",
    },
    ["<leader>td"] = {
      "<cmd>TroubleToggle document_diagnostics<CR>",
      "Toggle Document Diagnostics",
    },
    ["gR"] = {
      "<cmd>TroubleToggle lsp_references<CR>",
      "Toggle References",
    },
    ["<leader>tl"] = {
      "<cmd>TroubleToggle loclist<CR>",
      "Toggle Location List",
    },
    ["<leader>tq"] = {
      "<cmd>TroubleToggle quickfix<CR>",
      "Toggle Quickfix List",
    },
    ["<leader>tt"] = {
      "<cmd>TroubleToggle<CR>",
      "Toggle Trouble",
    },
  },
}

return M
