vim.pack.add({
  { src = "https://github.com/f-person/git-blame.nvim" },
})

require("gitblame").setup({
  message_template = "    <summary> • <author> • <date> • <<sha>>", -- template for the blame message, check the Message template section for more options
  date_format = "%m-%d-%Y", -- template for the date, check Date format section for more options
  virtual_text_column = 80, -- virtual text start column, check Start virtual text at column section for more options
  delay = 0,
  max_commit_summary_length = 20,
  message_when_not_committed = "    Not commited yet",
})
