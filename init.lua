--
--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this


    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.shiftwidth = 4     -- Number of spaces for each indentation
vim.opt.tabstop = 4        -- Number of spaces a tab counts for
vim.opt.softtabstop = 4    -- Number of spaces a tab counts for when editing
vim.opt.smartindent = true -- Do smart autoindenting when starting a new line

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- Improve performance with larger files
vim.opt.redrawtime = 1500
vim.opt.maxmempattern = 5000

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 250 -- Faster key sequence completion

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>')
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')

vim.keymap.set('n', '<leader>de', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float)

vim.keymap.set('n', '<leader>rr', ':%s:::g<Left><Left><Left>')
vim.keymap.set('v', '<leader>rr', ':s:::g<Left><Left><Left>')

vim.keymap.set('n', '<leader>i', [["_diwP]])

-- Visual mode speedy stuff
vim.keymap.set('v', '<>e', '=')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Fixing indentation
vim.keymap.set('n', '>', '>>')
vim.keymap.set('n', '<', '<<')

vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.opt.wrap = false

-- Define a function to toggle line wrap with word break
function Toggle_wrap()
  local wrap = vim.wo.wrap
  local linebreak = vim.wo.linebreak
  vim.wo.wrap = not wrap
  vim.wo.linebreak = not linebreak
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'org',
  callback = function()
    vim.opt_local.wrap = true
  end,
})

-- Map <leader>sw to the toggle_wrap function
vim.api.nvim_set_keymap('n', '<leader>tw', '<cmd>lua Toggle_wrap()<CR>', { noremap = true, silent = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth',
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>ga', ':G add .<CR>')
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
      vim.keymap.set('n', '<leader>gc', ":G commit -m '")
      vim.keymap.set('n', '<leader>go', ':GBrowse<CR>')
      vim.keymap.set('n', '<leader>gb', ':G checkout ')
      vim.keymap.set('n', '<leader>gu', ':G push<CR>')
      vim.keymap.set('n', '<leader>gd', ':G pull --rebase<CR>')
    end,
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --


  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      default_file_explorer = true,
    },
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },
  {
    'mattn/emmet-vim',
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      }
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
      -- Additional completion sources
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()
      -- Define LSP capabilities with proper completion support
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          'documentation',
          'detail',
          'additionalTextEdits',
        }
      }

      -- Enhance capabilities for completion
      local has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
      if has_cmp then
        capabilities = cmp_lsp.default_capabilities(capabilities)
      end

      -- Enhanced floating window appearance
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or 'rounded'
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      -- On-attach function for applying keymaps when LSP attaches to a buffer
      local on_attach = function(client, bufnr)
        -- Helper for easier keymap setting
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        -- Define keymaps
        nmap('gd', vim.lsp.buf.definition, 'Go to Definition')
        nmap('gr', vim.lsp.buf.references, 'Go to References')
        nmap('gi', vim.lsp.buf.implementation, 'Go to Implementation')
        nmap('gD', vim.lsp.buf.declaration, 'Go to Declaration')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
        nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
        nmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
        nmap('<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, 'Format Document')

        -- Diagnostics keymaps
        nmap('[d', vim.diagnostic.jump({ count = 1, float = true }), 'Previous Diagnostic')
        nmap(']d', vim.diagnostic.jump({ count = -1, float = true }), 'Next Diagnostic')
        nmap('<leader>d', vim.diagnostic.open_float, 'Show Diagnostic Error')

        -- Add signature help on trigger characters
        if client.server_capabilities.signatureHelpProvider then
          -- Auto show signature help when typing a function open paren or comma
          local trigger_chars = client.server_capabilities.signatureHelpProvider.triggerCharacters or { '(', ',' }
          for _, char in ipairs(trigger_chars) do
            vim.keymap.set('i', char, function()
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(char, true, true, true), 'n', true)
              vim.lsp.buf.signature_help()
            end, { buffer = bufnr, silent = true, noremap = true })
          end
        end
      end

      -- Configure mason-lspconfig
      require('mason-lspconfig').setup {
        -- Servers to automatically install
        ensure_installed = {
          'lua_ls',
          'pyright',
          'jsonls',
          'html',
          'cssls',
          'bashls',
          'yamlls',
        },

        -- Configure how servers are set up
        handlers = {
          -- Default handler - applied to all servers that don't have a specific handler
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              on_attach = on_attach,
            }
          end,

          -- Custom configurations for specific servers
          ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup {
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                Lua = {
                  completion = {
                    callSnippet = 'Replace',
                  },
                  diagnostics = {
                    globals = { 'vim' }, -- Recognize 'vim' global
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file('', true),
                    checkThirdParty = false,
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            }
          end,

          ['pyright'] = function()
            require('lspconfig').pyright.setup {
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                python = {
                  analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'workspace',
                  },
                }
              }
            }
          end,
        },
      }

      -- Configure diagnostic display
      vim.diagnostic.config {
        virtual_text = {
          source = 'if_many',
          prefix = '●', -- Could be '■', '▎', 'x'
        },
        float = {
          source = 'always',
          border = 'rounded',
          header = '',
          prefix = '',
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      }

      -- Change diagnostic symbols in the sign column
      local signs = { Error = "󰅙", Warn = "󰀦", Hint = "󰌵", Info = "󰋽" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load() -- Load vscode-like snippets
          if vim.fn.filereadable(vim.fn.expand('~/.config/nvim/lua/snippets/init.lua')) == 1 then
            require('luasnip.loaders.from_lua').load { paths = './lua/snippets/' }
          end
        end,
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help', -- Display function signatures
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-cmdline', -- Command line completion
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      -- Setup luasnip
      luasnip.config.setup({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        delete_check_events = 'TextChanged,InsertLeave',
      })

      -- Helper function to check if text before cursor is just whitespace
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          -- Add borders to completion window
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
          -- Format completion entries with symbols for different sources
          format = function(entry, vim_item)
            -- Source symbols
            local source_symbols = {
              buffer = '[Buf]',
              nvim_lsp = '[LSP]',
              luasnip = '[Snip]',
              path = '[Path]',
              nvim_lua = '[Lua]',
              orgmode = '[Org]',
            }

            -- Add source symbol to the right
            vim_item.menu = source_symbols[entry.source.name] or '[' .. entry.source.name .. ']'

            -- Limit abbr length to avoid jittering
            local label = vim_item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, 40)
            if truncated_label ~= label then
              vim_item.abbr = truncated_label .. '...'
            end

            return vim_item
          end,
        },
        -- Set up mappings for a more intuitive experience
        mapping = cmp.mapping.preset.insert({
          -- Basic navigation
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),

          -- Accept completion with Enter, intelligently (don't select if not explicitly selected)
          ['<CR>'] = cmp.mapping.confirm({ select = false }),

          -- Tab for smarter navigation and completion
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          -- Luasnip navigation
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),

          ['<C-h>'] = cmp.mapping(function()
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),
        }),

        -- Set source priorities
        sources = cmp.config.sources({
          { name = 'nvim_lsp',                priority = 1000 },
          { name = 'nvim_lsp_signature_help', priority = 900 },
          { name = 'luasnip',                 priority = 800 },
          { name = 'nvim_lua',                priority = 700 },
          { name = 'lazydev',                 priority = 600 },
          { name = 'path',                    priority = 500 },
          { name = 'orgmode',                 priority = 400 },
          { name = 'buffer',                  priority = 300, keyword_length = 3, max_item_count = 10 },
        }),

        -- Improve performance and UX
        performance = {
          max_view_entries = 15,  -- Show a reasonable number of items
          throttle = 30,          -- ms to throttle completion updates
          fetching_timeout = 100, -- ms until give up resolving completion
          async_budget = 1,       -- ms for async coroutines
        },

        -- Prefer exact matches first
        sorting = {
          priority_weight = 2.0,
          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },

        -- Match completion behavior to editor behavior
        completion = {
          completeopt = 'menu,menuone,noinsert',
          keyword_length = 1, -- Start after 1 character
          keyword_pattern = [=[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]]=],
        },

        -- Improve experimental features
        experimental = {
          ghost_text = false, -- Set to true if you want inline ghost text
        },
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' }
        })
      })
    end,
  },
  {
    'RRethy/base16-nvim',
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      -- statusline.setup { use_icons = vim.g.have_nerd_font }

      require('mini.comment').setup()

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context', -- Show code context as you scroll
    },
    main = 'nvim-treesitter.configs',            -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    config = function()
      -- Setup treesitter
      require('nvim-treesitter.configs').setup {
        ignore_install = { 'org' }, -- Problems with org, don't auto-install it

        -- Languages to install
        ensure_installed = {
          'bash', 'c', 'cpp', 'css', 'diff',
          'html', 'javascript', 'jsdoc', 'json', 'jsonc',
          'lua', 'luadoc', 'luap', 'markdown', 'markdown_inline',
          'python', 'query', 'regex', 'rust', 'scss',
          'tsx', 'typescript', 'vim', 'vimdoc', 'yaml',
        },

        -- Auto-install missing parsers when entering buffer
        auto_install = true,

        -- Consistent syntax highlighting
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby', 'org' },
        },

        -- Indentation based on treesitter
        indent = {
          enable = true,
          disable = { 'ruby', 'python' }, -- Python indentation can be weird with treesitter
        },

        -- Incremental selection based on syntax tree
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = '<nop>',
            node_decremental = '<bs>',
          },
        },
      }

      -- Configure Treesitter Context
      require('treesitter-context').setup {
        enable = true,
        max_lines = 3,
        min_window_height = 5,
        line_numbers = true,
        multiline_threshold = 1,
        trim_scope = 'outer',
        mode = 'cursor',
      }
    end,
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup {
        keymaps = {
          insert = '<C-g>s',
          insert_line = '<C-g>S',
          normal_cur = '<leader>ss',
          normal_cur_line = '<leader>SS',
          visual = '<leader>s',
          visual_line = '<leader>S',
          delete = 'ds',
          change = 'cs',
          change_line = 'cS',
        },
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').create_default_mappings()
    end,
  },
  {
    'Mofiqul/dracula.nvim',
    config = function()
      require('dracula').setup {
        transparent_bg = true,
      }
    end,
  },
  {
    'nvim-orgmode/org-bullets.nvim',
    config = function()
      require('org-bullets').setup()
    end,
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_startup_folded = 'content',
        org_default_notes_file = '~/orgfiles/inbox.org',
        org_hide_emphasis_markers = true,
        org_capture_templates = {
          l = {
            description = 'Literature Note',
            template = [[* %^{Title}
:PROPERTIES:
:ID:       %(random-hex)
:CREATED:  %U
:SOURCE:   %^{Source|Article|Book|Paper|Video|Podcast}
:AUTHOR:   %^{Author}
:URL:      %^{URL}
:END:

** Summary
%?

** Key Points
-

** Quotes
-

** Questions/Thoughts
-

** Permanent Note Candidates
- [ ]
]],
            target = '~/orgfiles/literature/%<%Y%m%d>-${slug}.org',
          },
          m = 'Meeting',
          mr = {
            description = 'Recurring',
            template = '** Meeting: %t %?\n:PROPERTIES:\n:Date: %t\n:Participants: \n:END:\n\n*** Agenda\n\n\n*** Notes\n\n\n*** Action Items\n- [ ] \n',
            target = '~/orgfiles/meetings.org',
            headline = 'Recurring',
          },
          mo = {
            description = 'One time',
            template = '** Meeting: %t %?\n:PROPERTIES:\n:Date: %t\n:Participants: \n:END:\n\n*** Agenda\n\n\n*** Notes\n\n\n*** Action Items\n- [ ] \n',
            target = '~/orgfiles/meetings.org',
            headline = 'One Time',
          },
          t = 'Task',
          th = {
            description = 'Healthcare',
            template = '** TODO %^{Task description}\nDEADLINE: %^{Deadline Date}t',
            target = '~/orgfiles/healthcare-moc.org',
            headline = 'TODOS',
          },
          tg = {
            description = 'General',
            template = '** TODO %^{Task description}\nDEADLINE: %^{Deadline Date}t',
            target = '~/orgfiles/inbox.org',
            headline = 'TODOS',
          },
          f = {
            description = 'Fleeting note',
            template = '\n* %? :inbox:\n:PROPERTIES:\n:CREATED: %U\n:END:\n\n',
            target = '~/orgfiles/inbox.org',
          },
          l = {
            description = 'LeetCode Problem',
            template = '* TODO [[%^{Problem URL}][%^{Problem Title}]]\n:PROPERTIES:\n:Difficulty: %^{Difficulty|Easy|Medium|Hard}\n:Pattern: %^{Pattern}\n:Priority: %^{Priority|High|Medium|Low}\n:END:\n%?',
            target = '~/orgfiles/leet-code.org',
          },
          L = {
            description = 'New LeetCode Problem',
            template = '~/.config/nvim/templates/leetcode-problems.org',
            target = '~/org/leetcode/%<%Y%m%d>-${slug}.org',
            type = 'file',
          },
        },
      }

      vim.keymap.set('n', '<leader>oo', '<cmd>e ~/orgfiles/__index.org<CR>')
    end,
  },
  {
    'chipsenkbeil/org-roam.nvim',
    tag = '0.1.1',
    config = function()
      require('org-roam').setup {

        directory = '~/orgfiles',
      }
    end,
  },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'liquid',
  callback = function()
    vim.opt_local.expandtab = true -- Use spaces
    vim.opt_local.shiftwidth = 2   -- Number of spaces for indentation
    vim.opt_local.tabstop = 2      -- Width of tab character
    vim.opt_local.softtabstop = 2  -- Number of spaces for a tab
  end,
})

-- Enable true color
if vim.fn.has("termguicolors") == 1 then
  vim.opt.termguicolors = true
end

-- Adjust CursorHold autocommand delay
vim.opt.updatetime = 250

-- Fast and smooth scrolling
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.cmd [[set conceallevel=3]]

-- Improve UI appearance
vim.opt.termguicolors = true
vim.cmd.colorscheme 'ibm'

-- Improve LSP experience
-- Setup handlers for better LSP user experience
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, { border = "rounded" }
)

-- This lets us detect inactive language servers faster
vim.lsp.set_log_level("off")

-- Setup auto-formatting
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
    if client and client.server_capabilities.documentFormattingProvider then
      vim.lsp.buf.format({ async = false, timeout_ms = 1000 })
    end
  end,
})

-- Show context when scrolling
local function add_highlight_to_context()
  vim.api.nvim_set_hl(0, "ContextHighlight", { underline = true, sp = "#717CB4" })
  vim.api.nvim_set_hl(0, "ContextHighlightLineNr", { fg = "#717CB4" })
end

add_highlight_to_context()

-- Make sure snippets work as expected
vim.api.nvim_create_autocmd({ "InsertLeave", "CursorHold" }, {
  callback = function()
    local luasnip = require "luasnip"
    if luasnip.session and luasnip.session.current_nodes then
      if not luasnip.session.jump_active and not require("luasnip").jumpable(1) then
        luasnip.unlink_current()
      end
    end
  end,
})
