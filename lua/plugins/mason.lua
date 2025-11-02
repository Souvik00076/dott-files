return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- LSP Servers
        "lua-language-server",
        "pyright",
        "typescript-language-server",
        "rust-analyzer",
        -- Linters
        "eslint-lsp",
        "shellcheck",
        -- Formatters
        "prettier",
        "stylua",
        "black",
        "isort",
      },
    },
  },
}
