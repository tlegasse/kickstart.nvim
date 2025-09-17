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

-- Disable providers for faster startup
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.loader.enable() -- Faster module loading (if Neovim 0.9+)
vim.opt.lazyredraw = true -- Don't redraw during macros
vim.opt.ttyfast = true -- Faster terminal

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- [[ Setting options ]]
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.smartindent = true -- Do smart autoindenting when starting a new line
vim.opt.autoindent = true  -- Copy indent from current line when starting new line
vim.opt.shiftround = true  -- Round indent to multiple of shiftwidth

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

vim.opt.hlsearch = true  -- Highlight search results
vim.opt.incsearch = true -- Incremental search

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<cr>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', '<cmd>bd<CR>')
vim.keymap.set('n', '<leader>bp', '<cmd>bp<CR>')
vim.keymap.set('n', '<leader>bn', '<cmd>bn<CR>')

vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>')

vim.keymap.set('n', '<leader>de', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float)

vim.keymap.set('n', '<leader>rr', ':%s:::g<Left><Left><Left>')
vim.keymap.set('v', '<leader>rr', ':s:::g<Left><Left><Left>')

vim.keymap.set('n', '<leader>i', [["_ciw<C-r>+<Esc>]])

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


vim.keymap.set('n', '<leader>of', ':lua vim.ui.open(vim.fn.expand("%"))<cr>')
vim.opt.wrap = false

-- Define a function to toggle line wrap with word break
function Toggle_wrap()
    local wrap = vim.wo.wrap
    local linebreak = vim.wo.linebreak
    vim.wo.wrap = not wrap
    vim.wo.linebreak = not linebreak
end


-- Map <leader>sw to the toggle_wrap function
vim.api.nvim_set_keymap('n', '<leader>tw', '<cmd>lua Toggle_wrap()<CR>', { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set({'n','v'}, '<leader><leader>', '<CMD>Telescope buffers<CR>')

vim.keymap.set("n", "<leader>p", "<CMD>Telescope yank_history<CR>")

vim.keymap.set('n', '<leader>oo', '<cmd>e ~/orgfiles/__index.org<CR>')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

vim.keymap.set('n', '<leader>u', "<CMD>UndotreeToggle<CR><C-w><C-w>")

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
    -- using packer.nvim
    {
        'nmac427/guess-indent.nvim',
        event  = 'BufReadPost',
        config = function() require('guess-indent').setup {} end,
    },
    {
        'tpope/vim-fugitive',
        cmd = { 'Git', 'G', 'GBrowse' },
        keys = {
            { '<leader>ga', ':G add .<CR>', desc = 'Git add all' },
            { '<leader>gs', '<cmd>Git<CR>', desc = 'Git status' },
            { '<leader>gc', ":G commit -m '", desc = 'Git commit' },
            { '<leader>go', ':GBrowse<CR>', desc = 'Git browse' },
            { '<leader>gb', ':G checkout ', desc = 'Git checkout' },
            { '<leader>gu', ':G push<CR>', desc = 'Git push' },
            { '<leader>gd', ':G pull --rebase<CR>', desc = 'Git pull' },
        }
    },
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
        keys = { 's', 'S', 'gs' }, -- Default leap mappings
        config = function()
            require('leap').create_default_mappings()
        end,
    },
    {
        "mbbill/undotree",
        cmd = 'UndotreeToggle',
        keys = { { '<leader>u', '<CMD>UndotreeToggle<CR><C-w><C-w>', desc = 'Toggle Undotree' } },
    },
    {
        "gbprod/yanky.nvim",
        keys = { 
            { '<leader>p', '<CMD>Telescope yank_history<CR>', desc = 'Yank history' },
        },
        opts = {
            highlight = {
                on_put = false,
                on_yank = false,
            },
            ring = {
                history_length = 100,
                storage = "shada",
                storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db",
                sync_with_numbered_registers = true,
                cancel_event = "update",
                ignore_registers = { "_" },
                update_register_on_cycle = false,
                permanent_wrapper = nil,
            },
        },
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
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        keys = {
            { "<leader>a", function() require('harpoon'):list():add() end, desc= 'Harpoon add' },
            { "<leader>l", function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, desc= 'Harpoon list' },
            { "<leader>g", function() require('harpoon'):list():select(1) end },
            { "<leader>c", function() require('harpoon'):list():select(2) end },
            { "<leader>r", function() require('harpoon'):list():select(3) end },
            { "<leader>h", function() require('harpoon'):list():select(4) end },
            { "<C-S-P>",   function() require('harpoon'):list():prev() end },
            { "<C-S-N>",   function() require('harpoon'):list():next() end },
        },
        config = function()
            require('harpoon'):setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = false,
                    save_on_change = false,
                }
            })
        end
    },
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
            -- In your telescope config, update the setup:
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
                    layout_config = {
                        prompt_position = "top",
                        width = 0.9,
                        height = 0.8,
                    },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {
                            ['<C-j>'] = require('telescope.actions').move_selection_next,
                            ['<C-k>'] = require('telescope.actions').move_selection_previous,
                        },
                    },
                    extensions = {
                        ['ui-select'] = {
                            require('telescope.themes').get_dropdown(),
                        },
                    },
                },
                -- ... rest of your config
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
            vim.keymap.set('n', '<leader>v', function()
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
        cmd = 'Oil',
        keys = {
            { '<leader>e', '<cmd>Oil<CR>', desc = 'Open Oil' },
        },
        opts = {
            view_options = {
                show_hidden = true,
            },
            default_file_explorer = true,
        },
        dependencies = { 'echasnovski/mini.icons' },
    },
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
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
        event = { 'BufReadPre', 'BufNewFile' },
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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr }
                -- Navigation
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to Definition' }))
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to Declaration' }))
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Go to References' }))
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to Implementation' }))
                vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = 'Go to Type Definition' }))
                
                -- Hover and signature help
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover Documentation' }))
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature Help' }))
                vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature Help' }))
                
                -- Code actions and refactoring
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename Symbol' }))
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code Action' }))
                vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename' }))
                
                -- Formatting
                vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, vim.tbl_extend('force', opts, { desc = 'Format Document' }))
                vim.keymap.set('v', '<leader>f', function() vim.lsp.buf.format { async = true } end, vim.tbl_extend('force', opts, { desc = 'Format Selection' }))
                
                -- Diagnostics
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'Previous Diagnostic' }))
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'Next Diagnostic' }))
                vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, vim.tbl_extend('force', opts, { desc = 'Diagnostic Loclist' }))
                vim.keymap.set('n', '<leader>dq', vim.diagnostic.setqflist, vim.tbl_extend('force', opts, { desc = 'Diagnostic Quickfix' }))
                
                -- Workspace
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend('force', opts, { desc = 'Add Workspace Folder' }))
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', opts, { desc = 'Remove Workspace Folder' }))
                vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, vim.tbl_extend('force', opts, { desc = 'List Workspace Folders' }))
                
                -- Document symbols
                vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, vim.tbl_extend('force', opts, { desc = 'Document Symbols' }))
                vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, vim.tbl_extend('force', opts, { desc = 'Workspace Symbols' }))
                
                -- Auto format on save for specific file types
                if client.supports_method('textDocument/formatting') then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = bufnr,
                        callback = function()
                            if vim.bo.filetype ~= 'markdown' then -- Exclude markdown from auto-format
                                vim.lsp.buf.format({ async = false })
                            end
                        end,
                    })
                end
            end

            require('mason-lspconfig').setup {
                ensure_installed = {
                    'lua_ls', 'pyright', 'html', 'cssls', 'bashls',
                    'ts_ls', 'eslint', 'jsonls', 'yamlls', 'marksman',
                    'rust_analyzer', 'gopls', 'clangd', 'dockerls',
                    'tailwindcss', 'emmet_ls', 'prismals', 'sqlls'
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup {
                            capabilities = capabilities,
                            on_attach = on_attach,
                        }
                    end,
                    ['lua_ls'] = function()
                        require('lspconfig').lua_ls.setup {
                            capabilities = capabilities,
                            on_attach = on_attach,
                            settings = {
                                Lua = {
                                    diagnostics = { globals = { 'vim' } },
                                    workspace = { checkThirdParty = false },
                                    telemetry = { enable = false },
                                },
                            },
                        }
                    end,
                },
            }
        end,
    },
    {
        'nvim-orgmode/orgmode',
        ft = { 'org' },
        event = 'VeryLazy', -- Keep both for flexibility
        dependencies = { 'nvim-orgmode/org-bullets.nvim' },
        config = function()
            -- Move org-bullets config here too
            require('org-bullets').setup()
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
                        template = '** Meeting: %t %?\n:PROPERTIES:\n:Date: %t\n:Participants: %^{Participants}\n:Client: %^{Client}\n:Project: %^{Project}\n:END:\n\n*** Agenda\n\n\n*** Notes\n\n\n*** Action Items\n**** TODO \n',
                        target = '~/orgfiles/meetings.org',
                        headline = 'Recurring',
                    },
                    mo = {
                        description = 'One time',
                        template = '** Meeting: %t %?\n:PROPERTIES:\n:Date: %t\n:Participants: %^{Participants}\n:Client: %^{Client}\n:Project: %^{Project}\n:END:\n\n*** Agenda\n\n\n*** Notes\n\n\n*** Action Items\n**** TODO \n',
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
        ft = { 'org' }, -- Only load for org files
        cmd = { 'OrgRoamNodeFind', 'OrgRoamNodeInsert' },
        config = function()
            require('org-roam').setup {
                directory = '~/orgfiles',
            }
        end,
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CmdlineEnter' },
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
                        require('luasnip.loaders.from_lua').load { paths = '~/.config/nvim/lua/snippets/' }
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

            luasnip.config.setup({ history = true, updateevents = 'TextChanged,TextChangedI' })

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.expand_or_jump()
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
                }),

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }),
                performance = {
                    max_view_entries = 10,
                    throttle = 30,
                    fetching_timeout = 80,
                },
                completion = {
                    completeopt = 'menu,menuone,noselect',
                },
            })

        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'VeryLazy' }, -- Changed from BufReadPost
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            auto_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    node_decremental = '<bs>',
                },
            },
        },
    },
    {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                backdrop = 25, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                width = 0.66, -- width of the Zen window
                height = 1, -- height of the Zen window
                options = {
                    signcolumn = "no", -- disable signcolumn
                    number = false, -- disable number column
                    relativenumber = false, -- disable relative numbers
                },
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                    -- you may turn on/off statusline in zen mode by setting 'laststatus' 
                    -- statusline will be shown only if 'laststatus' == 3
                    laststatus = 1, -- turn off the statusline in zen mode
                },
                twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
                tmux = { enabled = true }, -- disables the tmux statusline
            },
        },
    },
    { "pappasam/papercolor-theme-slim", lazy = false, priority = 1000 },
    require('kickstart.plugins.autopairs'),
    require('kickstart.plugins.gitsigns'),
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


-- Set colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme 'PaperColorSlimLight'

-- No swap/backup files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.conceallevel = 2
vim.opt.concealcursor = 'nc'
