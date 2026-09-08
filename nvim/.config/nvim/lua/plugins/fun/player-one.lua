vim.pack.add({
  { src = "https://github.com/jackplus-xyz/player-one.nvim" },
})

require("player-one").setup({
  is_enabled = true,
  min_interval = 0.05,
  theme = "chiptune", -- "chiptune", "crystal", "synth"
  master_volume = 0.1,
  debug = false,
  theme_config = {
    chiptune = {
      CursorMoved = true,
    },
  },
  binary = {
    auto_update = true,
    cache_timeout = 3600,
    download_timeout = 60,
    verify_checksum = true,
    use_development = true,
    github_api_token = nil,
    proxy = {
      url = nil,
      from_env = true,
    },
  },
})
