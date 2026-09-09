vim.cmd("nnoremap q: <nop>") -- disable command line history
-- vim.keymap.set('n', '<M-r>', ':restart<CR><CR>')

-- vim.keymap.set("n", "=", "0", { noremap = true, silent = true })

-- disable strange bindings in insert mode
vim.keymap.set("i", "<C-h>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Nop>", { noremap = true, silent = true })

-- replace default moves to start/end of the line
vim.keymap.set("n", "$", "<nop>")
vim.keymap.set("n", "gl", "$", { desc = "Go to end of line" })
vim.keymap.set("n", "0", "<nop>")
vim.keymap.set("n", "gh", "0", { desc = "Go to start of line" })

local function set_wrap()
  vim.opt.wrap = true
  vim.opt.linebreak = true
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")
end

local function set_nowrap()
  vim.opt.wrap = false
  vim.opt.linebreak = false
  vim.keymap.set("n", "j", "j")
  vim.keymap.set("n", "k", "k")
end

vim.keymap.set("n", "<leader>e", "<cmd>Explore<cr>")

vim.keymap.set("n", "<leader>sw", set_wrap)
vim.keymap.set("n", "<leader>sW", set_nowrap)

vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Prev buffer" })

-- helix-like jump to start/end of the line
-- vim.keymap.set("n", "gh", "0", { noremap = true, silent = true })
-- vim.keymap.set("n", "gl", "$", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>q", ":bd<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>Q", ":qa<cr>", { desc = "Exit neovim" })

vim.keymap.set("n", "<leader>u", "<CMD>Undotree<CR>")

-- pane navigation
-- vim.keymap.set("n", "<leader>sh", "<C-w>h", { desc = "Go to left pane" })
-- vim.keymap.set("n", "<leader>sj", "<C-w>j", { desc = "Go to bottom pane" })
-- vim.keymap.set("n", "<leader>sk", "<C-w>k", { desc = "Go to top pane" })
-- vim.keymap.set("n", "<leader>sl", "<C-w>l", { desc = "Go to right pane" })
vim.keymap.set("n", "<leader>ss", "<C-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>sx", "<C-w>c", { desc = "CLose split" })

vim.keymap.set(
  "n",
  "<leader>s=",
  "5<C-w>+",
  { desc = "Увеличить высоту" }
)
vim.keymap.set(
  "n",
  "<leader>s-",
  "5<C-w>-",
  { desc = "Уменьшить высоту" }
)
vim.keymap.set(
  "n",
  "<leader>s,",
  "5<C-w>>",
  { desc = "Увеличить ширину" }
)
vim.keymap.set(
  "n",
  "<leader>s.",
  "5<C-w><",
  { desc = "Уменьшить ширину" }
)

vim.keymap.set(
  "n",
  "<Esc>",
  "<Esc>:noh<CR>",
  { desc = "Clear last search by pressing ESC", silent = true }
)

-- Turn off diagnostic messages when it's not required (especially when I use python)
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config({ virtual_text = false })
  else
    vim.diagnostic.config({ virtual_text = true })
  end
end, { desc = "Toggle inline virtual text diagnostics" })

-- Command to toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
  local current_value = vim.diagnostic.is_enabled()
  if current_value then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable()
  end
end, { desc = "Toggle inline diagnostics" })

local function diagnostics_to_qf_sorted()
  local diags = vim.diagnostic.get()
  local items = vim.diagnostic.toqflist(diags)

  table.sort(items, function(a, b)
    if a.type ~= b.type then
      return a.type == "E"
    end
    if a.bufnr ~= b.bufnr then
      return a.bufnr < b.bufnr
    end
    return a.lnum < b.lnum
  end)

  vim.fn.setqflist({}, " ", { items = items })
end

local function diagnostics_errors_to_qf()
  local diags = vim.diagnostic.get(nil, {
    severity = vim.diagnostic.severity.ERROR,
  })

  local items = vim.diagnostic.toqflist(diags)
  vim.fn.setqflist({}, " ", { items = items })
end

vim.keymap.set("n", "<Leader>d", function()
  local qf = vim.fn.getqflist({ winid = 0 })
  local current = vim.api.nvim_get_current_win()

  -- quickfix закрыт
  if qf.winid == 0 then
    diagnostics_errors_to_qf()
    -- vim.diagnostic.setqflist()
    vim.cmd("wincmd J")
    -- vim.cmd("vertical resize 60")
    -- vim.cmd("botright vertical 60 copen")
    vim.cmd("copen")
    return
  end

  -- quickfix открыт, но фокус не на нем
  if current ~= qf.winid then
    diagnostics_errors_to_qf()
    vim.api.nvim_set_current_win(qf.winid)
    return
  end

  -- quickfix открыт и фокус на нем
  vim.cmd("cclose")
end, { desc = "Toggle diagnostics quickfix" })

vim.keymap.set("n", "<Leader>D", function()
  local qf = vim.fn.getqflist({ winid = 0 })
  local current = vim.api.nvim_get_current_win()

  -- quickfix закрыт
  if qf.winid == 0 then
    diagnostics_to_qf_sorted()
    -- vim.diagnostic.setqflist()
    vim.cmd("wincmd J")
    -- vim.cmd("vertical resize 60")
    -- vim.cmd("botright vertical 60 copen")
    vim.cmd("copen")
    return
  end

  -- quickfix открыт, но фокус не на нем
  if current ~= qf.winid then
    diagnostics_to_qf_sorted()
    vim.api.nvim_set_current_win(qf.winid)
    return
  end

  -- quickfix открыт и фокус на нем
  vim.cmd("cclose")
end, { desc = "Toggle diagnostics quickfix" })
