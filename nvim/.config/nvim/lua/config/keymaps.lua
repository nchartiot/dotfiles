-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Format and save with Ctrl+S
vim.keymap.set({ "n", "i", "v" }, "<C-s>", function()
  vim.lsp.buf.format({ async = false })
  vim.cmd("write")
end, { desc = "Format and save file" })
