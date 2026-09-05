return {
  filetypes = { "css" },
  cmd = { "vscode-css-language-server" },
  root_markers = { "package.json", ".git" },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}
