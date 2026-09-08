vim.pack.add({
  { src = "https://github.com/nvim-mini/mini.ai" },
})

require("mini.ai").setup({
  mappings = {
    around_next = "",
    inside_next = "",
    around_last = "",
    inside_last = "",

    -- Move cursor to corresponding edge of `a` textobject
    goto_left = "",
    goto_right = "",
  },
})
