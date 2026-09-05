return {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "pyrightconfig.json",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },

  single_file_support = false,

  settings = {
    basedpyright = {
      disableOrganizeImports = true,

      analysis = {
        typeCheckingMode = "recommended",
        -- typeCheckingMode = "basic",

        autoSearchPaths = true,
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,

        diagnosticMode = "workspace",
        -- diagnosticMode = "openFilesOnly",

        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
          genericTypes = false,
        },
      },
    },
  },
}
