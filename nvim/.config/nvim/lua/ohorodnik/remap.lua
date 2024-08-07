local nvim_tree_api = require('nvim-tree.api')
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection one line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection one line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Move next line to the end of current" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without overweiting clipboard" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("v", "<leader>f", '<cmd>lua vim.lsp.buf.format()<CR>', { desc = "Format selection" })

vim.keymap.set('n', '[e', function () vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Go to previous error" })
vim.keymap.set('n', ']e', function () vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, { desc = "Go to next error" })
vim.keymap.set('n', '[w', function () vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Go to previous warning" })
vim.keymap.set('n', ']w', function () vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN }) end, { desc = "Go to next warning" })
vim.keymap.set('n', '[i', function () vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.INFO }) end, { desc = "Go to previous info" })
vim.keymap.set('n', ']i', function () vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.INFO }) end, { desc = "Go to next info" })
vim.keymap.set('n', '[h', function () vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.HINT }) end, { desc = "Go to previous hint" })
vim.keymap.set('n', ']h', function () vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.HINT }) end, { desc = "Go to next hint" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

vim.keymap.set("n", "<leader>pv", nvim_tree_api.tree.toggle, { desc = "Open: New Tab" })
