if vim.g.vscode ~= nil then
  return
end

-- select context-aware indent
vim.keymap.set({"x", "o"}, "ai", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>", { desc = "Select outer indent" })
-- ensure selecting entire line (or just use Vai)
vim.keymap.set({"x", "o"}, "aI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>", { desc = "Select outer indent (entire line)" })
-- select inner block (only if block, only else block, etc.)
vim.keymap.set({"x", "o"}, "ii", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>", { desc = "Select inner indent" })
-- select entire inner range (including if, else, etc.)
vim.keymap.set({"x", "o"}, "iI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>", { desc = "Select inner indent (entire line)" })
