vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
  formatters_by_ft = {
    cpp = { "clang-format" },
    c = { "clang-format" },
    lua = { "stylua" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    markdown = { "mdformat" },
    html = { "prettierd", "prettier" },
    bash = { "shfmt" },
    rust = { "rustfmt" },
    yaml = { "yamlfix" },
    toml = { "taplo" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    sh = { "shfmt" },
    xml = { "xmlformatter" },
    typst = { "typstyle" },
    slint = { "slint-lsp" },
    nix = { "alejandra" },
    -- qml = { "qmlformat" }, -- WARN: IT WORKS SO BAD (functional part of JS (map, iters etc) are make tabs x10 wider)
    kdl = { "kdlfmt" },
    d2 = { "d2_fmt" },

    gdscript = { "gdformat" },

    openscad = { "topiary" },

    ["_"] = { "trim_whitespace", "trim_newlines" },
  },

  formatters = {
    -- https://doc.qt.io/qt-6/qtqml-tooling-qmlformat.html
    mdformat = {
      command = "mdformat",
      args = { "--wrap", "120" },
    },
    topiary = {
      command = "topiary",
      args = { "format", "$FILENAME"}
    },
    d2_fmt = {
      command = "d2",
      args = { "fmt", "$FILENAME" },
      stdin = false,
    },
    ruff = {
      ["line-length"] = 88,
      ["indent-width"] = 4,
    },
    ["slint-format"] = {
      append_args = {
        "--indentation",
        "2",
      },
    },
    stylua = {
      append_args = {
        "--syntax",
        "All",
        "--column-width",
        "80",
        "--line-endings",
        "Unix",
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--quote-style",
        "AutoPreferDouble",
        "--call-parentheses",
        "Always",
        "--collapse-simple-statement",
        "Never",
        "--space-after-function-names",
        "Never",
        "--sort-requires",
      },
    },
    typstyle = {
      append_args = {
        "--wrap-text",
        "--indent-width",
        "2",
        "--line-width",
        "75",
        "--quiet",
      },
    },
  },
})

function SyncFormat()
  require("conform").format({
    async = false,
    lsp_format = "fallback",
  })
end

function AsyncFormat()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
  })
end

vim.api.nvim_create_user_command("SyncFormat", SyncFormat, {})
vim.api.nvim_create_user_command("AsyncFormat", AsyncFormat, {})

vim.keymap.set("n", "<leader>lf", SyncFormat, { desc = "Format current file" })

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*',
--   callback = AsyncFormat,
-- })
