-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
----------------------------------------------------
-- Better paste (do not overwrite clipboard)
--------------------------------------------------
vim.keymap.set("x", "<leader>p", [["_dP]])

--------------------------------------------------
-- Delete without yanking (black hole)
--------------------------------------------------
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--------------------------------------------------
-- System clipboard yanks
--------------------------------------------------
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--------------------------------------------------
-- Keep search results centered + open folds
--------------------------------------------------
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--------------------------------------------------
-- Move selected lines up/down in visual mode
--
--------------------------------------------------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--------------------------------------------------
-- Quickfix navigation (global list)
--------------------------------------------------
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

--------------------------------------------------
-- Location list navigation (window-local list)
--------------------------------------------------
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "i" }, "<leader>w", "<cmd>w<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { silent = true })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { silent = true })

vim.keymap.set("n", "<leader>pl", "<cmd>Lexplor<CR>")

vim.keymap.set("n", "<M-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<M-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<cr>")

local term_buf = nil
local term_win = nil

vim.keymap.set("n", "<C-/>", function()
  if term_win and vim.api.nvim_win_is_valid(term_win) then
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  vim.cmd("botright split")
  vim.cmd("resize 10")
  vim.cmd("terminal")

  term_buf = vim.api.nvim_get_current_buf()
  term_win = vim.api.nvim_get_current_win()
end)
