-- Modern lsp-zero v2.x+ configuration
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- Keep your existing keybindings
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end)

-- Initialize Mason for LSP server management
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {}, -- Add servers you want automatically installed
  handlers = {
    lsp_zero.default_setup,
    -- Custom server configs go here
  },
})

-- Configure custom servers directly with lspconfig
local lspconfig = require('lspconfig')
lspconfig.shopify_theme_ls.setup({
  cmd = { 'shopify', 'theme', 'language-server' },
  filetypes = { 'liquid' },
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern '.theme-check.yml'(fname)
  end,
  init_options = {
    enableSchema = true,
    enableCompletions = true,
    enableSnippets = true,
    enableValidations = false,
  },
  flags = {
    debounce_text_changes = 150,
  },
})

-- Setup cmp (completion) separately
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-e>'] = cmp.mapping.abort(),
  },
})

-- No need for lsp.nvim_workspace() in v2.x+
