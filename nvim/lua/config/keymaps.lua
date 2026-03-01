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
