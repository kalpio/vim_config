-- ~/.config/nvim/lua/config/keymaps.lua
-- LazyVim keymaps matching Zed vim mode defaults
-- Reference: https://zed.dev/docs/vim
-- Use system clipboard for all yank/paste operations
vim.opt.clipboard = "unnamedplus"
-- Buffer/tab navigation
vim.keymap.set("n", "gt", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "gT", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev tab" })
-- File finder (Ctrl+P like Zed/Sublime)
vim.keymap.set("n", "<C-p>", function()
  if LazyVim and LazyVim.pick then
    LazyVim.pick("files")()
  else
    require("telescope.builtin").find_files()
  end
end, { desc = "Find files" })
-- Search in project (g/ - matches Zed vim mode)
vim.keymap.set("n", "g/", function()
  if LazyVim and LazyVim.pick then
    LazyVim.pick("live_grep")()
  else
    require("telescope.builtin").live_grep()
  end
end, { desc = "Open project-wide search" })
-- Git navigation (matching Zed vim mode)
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    require("gitsigns").nav_hunk("next")
  end
end, { desc = "Next git change" })
vim.keymap.set("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    require("gitsigns").nav_hunk("prev")
  end
end, { desc = "Prev git change" })
-- LSP shortcuts (matching Zed vim mode defaults)
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gy", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Go to type definition" })
vim.keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", { desc = "Go to implementation" })
vim.keymap.set("n", "gA", "<cmd>Telescope lsp_references<CR>", { desc = "Go to all references" })
vim.keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Find symbol in file" })
vim.keymap.set("n", "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "Find symbol in project" })
vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "gh", vim.diagnostic.open_float, { desc = "Show inline error (hover)" })
vim.keymap.set("n", "cd", vim.lsp.buf.rename, { desc = "Rename (change definition)" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover documentation" })
vim.keymap.set("n", "g]", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "g[", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev diagnostic" })
-- Splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Quick exit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>qQ", "<cmd>qa!<CR>", { desc = "Quit all (force)" })
vim.keymap.set("n", "<leader>qw", "<cmd>wqa<CR>", { desc = "Save all and quit" })
