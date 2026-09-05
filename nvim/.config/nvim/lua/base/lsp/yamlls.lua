return {
  filetypes = { "yaml" },
  cmd = { "yaml-language-server" },
  root_markers = {
    ".yamllint",
    ".git",
  },
  single_file_support = true,
  settings = {
    yaml = {
      keyOrdering = false,
      validate = true,
      hover = true,
      completion = true,
      format = {
        enable = false, -- форматирование лучше оставить отдельному форматтеру
      },
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        kubernetes = { "*.k8s.yaml", "*.k8s.yml" },
        ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",
        ["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
        ["https://json.schemastore.org/docker-compose.json"] = {
          "docker-compose.yml",
          "docker-compose.yaml",
        },
        ["https://json.schemastore.org/gitlab-ci.json"] = ".gitlab-ci.{yml,yaml}",
      },
    },
  },
}
