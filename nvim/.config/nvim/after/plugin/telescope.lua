if vim.g.vscode ~= nil then
  return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('v', '<leader>fg', builtin.grep_string, { desc = "Grep selected" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = "Last results" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Find files in git" })
