local basedpyright = {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
        diagnosticMode = "openFilesOnly",
      },
    },
  },
}

local ruff = {
  init_options = {
    settings = {
      lineLength = 120,  -- 注意 Ruff 的 LSP 可能使用驼峰命名
      args = { "--ignore=E501" },  -- 忽略行长度检查
    }
  }
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- copilot.lua only works with its own copilot lsp server
      copilot = { enabled = false },
    },
    ["*"] = {
      keys = {
        { "gd", "<cmd>FzfLua lsp_definitions     jump1=true ignore_current_line=true<cr>", desc = "Goto Definition", has = "definition" },
        { "gr", "<cmd>FzfLua lsp_references      jump1=true ignore_current_line=true<cr>", desc = "References", nowait = true },
        { "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
        { "gy", "<cmd>FzfLua lsp_typedefs        jump1=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },
      }
    },
  },
}

