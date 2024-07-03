if vim.g.vscode ~= nil then
  return
end

require("nvim-surround").setup({})
require("nvim-autopairs").setup()
require('guess-indent').setup()
