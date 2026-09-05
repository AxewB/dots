return {
  filetypes = { "lua" },
  cmd = { "lua-language-server" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua",
    "stylua.toml",
    ".git",
  },
  settings = {
    Lua = {
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
      diagnostics = {
        globals = { "vim" },
      },
      hint = { enable = true },
    },
  },
}
