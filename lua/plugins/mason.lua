return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "shellcheck",
      "shfmt",
      "ruff",
      "cmakelang",
      "cmakelint",
      "codelldb",
      "debugpy",
    },
  },
}
