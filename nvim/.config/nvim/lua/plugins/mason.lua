vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim.git' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim.git' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' }, -- auto install third party tools (such as formatters)
})

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd', -- c++
    'lua_ls', -- lua
    'zls', -- zig
    'ts_ls', -- typescript
    'marksman', -- markdown
    'cssls', -- SCSS
    'ast_grep', -- JSX, CSS
    'vimls', -- vim
    'rust_analyzer', -- rust
    'tinymist', -- typst LSP
    'qmlls', -- qml (Qt Quick GUI language)
    'bashls', -- bash LSP and formatter
    'slint_lsp', -- slint
  },
  automatic_installation = true,
})

require('mason-tool-installer').setup({
  ensure_installed = {
    'ast-grep', -- a lot
    'clang-format', -- c, cpp
    'ruff', -- python
    -- 'autoflake', -- python
    -- 'autopep8', -- python
    'prettier', -- a lot of langs
    'prettierd', -- a lot of langs
    'prettypst', -- typst
    'shfmt', -- bash
    'taplo', -- toml
    'xmlformatter', -- xml
    'yamlfix', -- yaml
    'stylua', -- lua
    'alejandra', -- nix
  },
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 24,
})
