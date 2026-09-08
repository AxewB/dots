vim.pack.add({
  { src = "https://github.com/jake-stewart/multicursor.nvim" },
})

local mc = require("multicursor-nvim")

mc.setup()

vim.keymap.set({ "n", "x" }, "<up>", function()
  mc.lineAddCursor(-1)
end)
vim.keymap.set({ "n", "x" }, "<down>", function()
  mc.lineAddCursor(1)
end)
vim.keymap.set({ "n", "x" }, "<S-up>", function()
  mc.lineSkipCursor(-1)
end)
vim.keymap.set({ "n", "x" }, "<S-down>", function()
  mc.lineSkipCursor(1)
end)

-- vim.keymap.set({ 'n', 'x' }, '<cr>', mc.toggleCursor)

vim.keymap.set({ "n", "x" }, "<C-n>", function()
  mc.matchAddCursor(1)
end)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
  -- Select a different cursor as the main one.
  layerSet({ "n", "x" }, "<left>", mc.prevCursor)
  layerSet({ "n", "x" }, "<right>", mc.nextCursor)

  -- Delete the main cursor.
  layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

  -- Enable and clear cursors using escape.
  layerSet("n", "<esc>", function()
    if not mc.cursorsEnabled() then
      mc.enableCursors()
    else
      mc.clearCursors()
    end
  end)
end)
