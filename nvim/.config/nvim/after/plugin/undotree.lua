if vim.g.vscode ~= nil then
  return
end

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
