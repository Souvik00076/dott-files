return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportWildcardImportFromLibrary = "none",
                reportMissingImports = "none",
                reportMissingModuleSource = "none",
                reportUnusedImport = "none",
                reportUnusedVariable = "none",
                reportUnusedExpression = "none",
                reportUnusedClass = "none",
                reportUndefinedVariable = "none",
              },
            },
          },
        },
      },
    },
  },
}
