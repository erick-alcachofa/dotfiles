vim.g.mapleader = " "

vim.keymap.set("i", "<C-s>", "<Esc>:w<cr>a", { silent = true })
vim.keymap.set("n", "<C-s>", ":w<cr>", { silent = true })

vim.keymap.set("i", "<A-K>", "<Esc>:m -2<CR>a", { silent = true })
vim.keymap.set("n", "<A-K>", ":m -2<CR>", { silent = true })
vim.keymap.set("v", "<A-K>", ":m '<-2<CR>gv=gv", { silent = true })

vim.keymap.set("i", "<A-J>", "<Esc>:m +1<CR>a", { silent = true })
vim.keymap.set("n", "<A-J>", ":m +1<CR>", { silent = true })
vim.keymap.set("v", "<A-J>", ":m '>+1<CR>gv=gv", { silent = true })

vim.keymap.set("n", "<A-d>", "\"_d", { silent = true })
vim.keymap.set("v", "<A-d>", "\"_d", { silent = true })

vim.keymap.set("n", "x", "v<A-d>", { silent = true, remap = true })

vim.keymap.set("i", "<A-l>", "<Right>", { silent = true, remap = true })
vim.keymap.set("i", "<A-h>", "<Left>", { silent = true, remap = true })
vim.keymap.set("i", "<A-j>", "<Down>", { silent = true, remap = true })
vim.keymap.set("i", "<A-k>", "<Up>", { silent = true, remap = true })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
