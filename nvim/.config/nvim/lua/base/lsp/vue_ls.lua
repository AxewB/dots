return {
  filetypes = { "vue" },
  cmd = { "vue-language-server", "--stdio" },
  root_markers = { "package.json", "vite.config.*", "vue.config.*", ".git" },
  settings = {
    vetur = {
      completion = true,
      validation = true,
    },
  },
}
