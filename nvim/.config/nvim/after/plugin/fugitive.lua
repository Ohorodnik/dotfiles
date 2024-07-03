if vim.g.vscode ~= nil then
  return
end

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git window (fugitive)" });
