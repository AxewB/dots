---comment
---@param direction "next" | "prev"
local function goto_next_diagnoctic(direction)
  local diag = nil
  if direction == "next" then
    diag = vim.diagnostic.get_next()
  elseif direction == "prev" then
    diag = vim.diagnostic.get_next()
  else
    vim.notify("Wrong diagnostic direction.", vim.log.levels.ERROR)
    return
  end

  if diag == nil then
    vim.notify("No more " .. direction .. " diagnostics", vim.log.levels.INFO)
    return
  end

  vim.diagnostic.jump({ diagnostic = diag })
end

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  -- virtual_text = true,
  float = {
    focusable = false,
    style = "minimal",
    border = nil,
    source = true,
    header = "",
    prefix = "",
    suffix = "",
  },
})

local servers = {
  "basedpyright", -- python
  "bashls", -- sh, bash, zsh
  "clangd", -- c, cpp
  "cssls", -- css, scss
  "lua_ls", -- lua
  -- 'marksman', -- markdown
  "markdown-oxide", -- markdown
  "qmlls", -- qml
  "rust_analyzer", -- rust
  "taplo", -- toml
  "tinymist", -- typst
  "ts_ls", -- ts, js
  "vimls", -- vim
  "vue_ls", -- vue
  "yamlls", -- yaml
  "zls", -- zig
  "slint_lsp", -- slint
  "nixd", -- nix
  "sqlls", -- sql
  "gdscript", -- godot
  "lemminx", -- xml
  "openscad-lsp" -- OpenSCAD
}

-- extending default LSP capabilities
local base_capabilities = vim.lsp.protocol.make_client_capabilities()
base_capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}
base_capabilities.textDocument.semanticTokens.multilineTokenSupport = true
base_capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, name in ipairs(servers) do
  local ok, cfg = pcall(require, "base.lsp." .. name)
  if ok and cfg then
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      base_capabilities,
      cfg.capabilities or {}
    )

    local final_cfg = vim.tbl_deep_extend("force", {}, cfg, {
      capabilities = capabilities,
    })

    vim.lsp.config(name, final_cfg)
    vim.lsp.enable(name)
  end
end

vim.lsp.config("*", { capabilities = base_capabilities })


-- local function ShowDiagnosticsOrHover()
--   local opts = { focusable = false }
--   local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
--   local diagnostics = vim.diagnostic.get(0, { lnum = lnum })
--
--   if diagnostics and #diagnostics > 0 then
--     vim.diagnostic.open_float(nil, opts)
--   else
--     vim.lsp.buf.hover()
--   end
-- end

-- Disable default LSP keybindings
for _, bind in ipairs({
  "grn",
  "gra",
  "gri",
  "grr",
  "grt",
  "]d",
  "[d",
  "]D",
  "[D",
  "K",
}) do
  pcall(vim.keymap.del, "n", bind)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local opts = { silent = true }
    -- stylua: ignore start
    vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<leader>lq", function() vim.diagnostic.setqflist() end, opts)
    -- vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)

    -- goto diagnostic
    vim.keymap.set("n", "<leader>ln", function() goto_next_diagnoctic("next") end, opts)
    vim.keymap.set("n", "<leader>lp", function() goto_next_diagnoctic("prev") end, opts)


    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>lk', vim.diagnostic.open_float, opts)
    -- vim.keymap.set("n", "K", ShowDiagnosticsOrHover, opts)
    vim.keymap.set("n", "<leader>lm", vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>lH', function () vim.lsp.inlay_hint.enable(true) end , opts)
    vim.keymap.set('n', '<leader>lh', function () vim.lsp.inlay_hint.enable(false) end , opts)
    -- stylua: ignore end

    -- Глобальный autocmd для всех буферов
    -- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    --   callback = function()
    --     vim.diagnostic.open_float({
    --       scope = "cursor",
    --       focusable = false,
    --       close_events = {
    --         "BufLeave",
    --         "CursorMoved",
    --         "InsertEnter",
    --         "Quit",
    --         "InsertLeave",
    --         "FocusLost",
    --       },
    --     })
    --   end,
    -- })
  end,
})

-- Start, Stop, Restart, Log commands // https://github.com/Rishabh672003/Neovim/blob/main/lua/rj/lsp.lua
vim.api.nvim_create_user_command("LspStart", function()
  vim.cmd.e()
end, { desc = "Starts LSP clients in the current buffer" })

vim.api.nvim_create_user_command("LspStop", function(opts)
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    if opts.args == "" or opts.args == client.name then
      client:stop(true)
      vim.notify(client.name .. ": stopped")
    end
  end
end, {
  desc = "Stop all LSP clients or a specific client attached to the current buffer.",
  nargs = "?",
  complete = function(_, _, _)
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local client_names = {}
    for _, client in ipairs(clients) do
      table.insert(client_names, client.name)
    end
    return client_names
  end,
})

vim.api.nvim_create_user_command("LspRestart", function()
  local detach_clients = {}
  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
    client:stop(true)
    if vim.tbl_count(client.attached_buffers) > 0 then
      detach_clients[client.name] = {
        client,
        vim.lsp.get_client_by_id(client.id),
      }
    end
  end
  local timer = vim.uv.new_timer()
  if not timer then
    return vim.notify("Servers are stopped but havent been restarted")
  end
  timer:start(
    100,
    50,
    vim.schedule_wrap(function()
      for name, client in pairs(detach_clients) do
        local client_id = vim.lsp.start(client[1].config, { attach = false })
        if client_id then
          for _, buf in ipairs(client[2]) do
            vim.lsp.buf_attach_client(buf, client_id)
          end
          vim.notify(name .. ": restarted")
        end
        detach_clients[name] = nil
      end
      if next(detach_clients) == nil and not timer:is_closing() then
        timer:close()
      end
    end)
  )
end, {
  desc = "Restart all the language client(s) attached to the current buffer",
})

vim.api.nvim_create_user_command("LspLog", function()
  vim.cmd.vsplit(vim.lsp.log.get_filename())
end, {
  desc = "Get all the lsp logs",
})

vim.api.nvim_create_user_command("LspInfo", function()
  vim.cmd("silent checkhealth vim.lsp")
end, {
  desc = "Get all the information about all LSP attached",
})
