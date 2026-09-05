return {
  filetypes = { "javascript", "typescript" },
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = {
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git",
  },
  single_file_support = false,
  settings = {
    typescript = {
      preferences = {
        importModuleSpecifierPreference = "relative",
      },
    },
    javascript = {
      preferences = {
        importModuleSpecifierPreference = "relative",
      },
    },
  },
}
