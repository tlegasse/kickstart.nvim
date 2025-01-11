local lsp = require 'lsp-zero'
lsp.preset 'recommended'

lsp.configure('shopify_theme_ls', {
  cmd = { 'shopify', 'theme', 'language-server' },
  filetypes = { 'liquid' },
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern '.theme-check.yml'(fname)
  end,
  init_options = {
    enableSchema = true,
    enableCompletions = true,
    enableSnippets = true,
    enableValidations = false, -- we can turn this on later if needed
  },
  flags = {
    debounce_text_changes = 150,
  },
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr }

  -- Quick jumping
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- [G]oto [D]efinition
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- [G]oto [R]eferences
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts) -- Hover docs on cursor

  -- Quick fixes and refactoring
  vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- [C]ode [A]ction
  vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- [R]e[n]ame

  -- Diagnostics
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts) -- Previous diagnostic
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts) -- Next diagnostic
  vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- Show diagnostic

  -- Completion keybinds (in insert mode)
  local cmp = require 'cmp'
  cmp.setup {
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete(), -- Show completion suggestions
      ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept completion
      ['<C-n>'] = cmp.mapping.select_next_item(), -- Next suggestion
      ['<C-p>'] = cmp.mapping.select_prev_item(), -- Previous suggestion
      ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Scroll docs down
      ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Scroll docs up
      ['<C-e>'] = cmp.mapping.abort(), -- Close completion window
    },
  }
end)

lsp.nvim_workspace()
lsp.setup()
