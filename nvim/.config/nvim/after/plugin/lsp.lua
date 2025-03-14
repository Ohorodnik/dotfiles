if vim.g.vscode ~= nil then
  return
end

local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local nvim_lsp = require('lspconfig')

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

nvim_lsp.denols.setup {
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

nvim_lsp.ts_ls.setup {
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

nvim_lsp['hls'].setup {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

nvim_lsp.lua_ls.setup(lsp.nvim_lua_ls())

cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
    { noremap = true, silent = true, desc = "Go to declaration" })
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = true, desc = "Go to definition" })
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true, desc = "Show hover" })
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
    { noremap = true, silent = true, desc = "Go to implementation" })
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
    { noremap = true, silent = true, desc = "Show signature help" })
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
    { noremap = true, silent = true, desc = "Add workspace folder" })
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
    { noremap = true, silent = true, desc = "Remove workspace folder" })
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
    { noremap = true, silent = true, desc = "List workspace folders" })
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
    { noremap = true, silent = true, desc = "Go to type definition" })
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
    { noremap = true, silent = true, desc = "Rename" })
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
    { noremap = true, silent = true, desc = "Code action" })
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
    { noremap = true, silent = true, desc = "List references" })
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>',
    { noremap = true, silent = true, desc = "Show line diagnostics" })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'eslint',
    'angularls',
    'cssls',
    'docker_compose_language_service',
    'dockerls',
    'html',
    'jsonls',
    'sqlls',
    'pyright',
    'volar',
  },
  handlers = {
    lsp.default_setup,
  },
})

lsp.setup()
