vim.pack.add({
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  -- deps
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

local enabled_opts = {
  enable_close = true,
  enable_rename = true,
  enable_close_on_slash = true,
}

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = false, -- Auto close tags
    enable_rename = false, -- Auto rename pairs of tags
    enable_close_on_slash = false, -- Auto close on trailing </
  },

  per_filetype = {
    ["html"] = enabled_opts,

    ["javascript"] = enabled_opts,
    ["typescript"] = enabled_opts,

    ["svelte"] = enabled_opts,
    ["vue"] = enabled_opts,
    ["jsx"] = enabled_opts,
    ["tsx"] = enabled_opts,

    ["xml"] = enabled_opts,
    ["markdown"] = enabled_opts,
    ["astro"] = enabled_opts,
    ["dot"] = enabled_opts,
    ["glimmer"] = enabled_opts,
    ["handlebars"] = enabled_opts,
    ["liquid"] = enabled_opts,
    ["vento"] = enabled_opts,
    ["php"] = enabled_opts,
    ["rescript"] = enabled_opts,
    ["twig"] = enabled_opts,
  },
})
