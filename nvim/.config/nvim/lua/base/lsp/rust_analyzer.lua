return {
  filetypes = { "rust" },
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.toml", "rust-project.json", ".git" },
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
      diagnostics = {
        enable = true;
        enableExperimental = false,  -- уберёт typed_hole паники
      },
      logging = {
        level = "ERROR",
      },
    },
  },
}
