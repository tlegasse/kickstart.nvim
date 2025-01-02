local M = {}

function M.setup()
  -- Enterprise-Inverse.lua
  -- A professional dark theme optimized for Treesitter

  local colors = {
    bg = "#2B2B33",
    bg_dark = "#1E1E24",
    bg_highlight = "#363642",
    bg_visual = "#404050",
    
    fg = "#E8E6E3",
    fg_dark = "#BFBDB6",
    fg_gutter = "#4A4A55",
    
    -- Enterprise blues
    blue = "#8FB7E6",
    blue_dark = "#7BA2D3",
    blue_light = "#A3C9F2",
    
    -- Supporting colors
    green = "#96B4B2",
    cyan = "#9AAFE6",
    red = "#E69BA0",
    orange = "#D4B0A1",
    yellow = "#E6C99B",
    purple = "#B4A3E6",
    
    -- UI elements
    border = "#4A4A55",
    selection = "#404050",
    line_number = "#4A4A55",
    line_number_active = "#8FB7E6",
    panel = "#2B2B33",
    none = "NONE"
  }

  -- Highlight group definitions
  local highlights = {
    -- Treesitter syntax groups
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.blue_light },
    ["@constant"] = { fg = colors.purple },
    ["@constant.builtin"] = { fg = colors.purple, bold = true },
    ["@keyword"] = { fg = colors.blue, bold = true },
    ["@keyword.function"] = { fg = colors.blue, bold = true },
    ["@keyword.return"] = { fg = colors.blue, bold = true },
    ["@keyword.operator"] = { fg = colors.blue },
    
    ["@function"] = { fg = colors.blue_light },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@function.macro"] = { fg = colors.cyan },
    ["@method"] = { fg = colors.blue_light },
    
    ["@string"] = { fg = colors.green },
    ["@string.regex"] = { fg = colors.orange },
    ["@string.escape"] = { fg = colors.orange, bold = true },
    
    ["@number"] = { fg = colors.purple },
    ["@boolean"] = { fg = colors.purple },
    
    ["@type"] = { fg = colors.blue_dark },
    ["@type.builtin"] = { fg = colors.blue_dark, bold = true },
    ["@type.qualifier"] = { fg = colors.blue },
    
    ["@parameter"] = { fg = colors.fg },
    ["@property"] = { fg = colors.fg_dark },
    
    ["@constructor"] = { fg = colors.blue_dark },
    ["@operator"] = { fg = colors.blue },
    
    ["@comment"] = { fg = colors.fg_gutter, italic = true },
    ["@punctuation"] = { fg = colors.fg_dark },
    ["@punctuation.bracket"] = { fg = colors.fg_dark },
    ["@punctuation.delimiter"] = { fg = colors.fg_dark },
    
    -- Important language constructs
    ["@conditional"] = { fg = colors.blue, bold = true },
    ["@repeat"] = { fg = colors.blue, bold = true },
    ["@debug"] = { fg = colors.red },
    ["@label"] = { fg = colors.blue },
    ["@include"] = { fg = colors.blue, bold = true },
    ["@exception"] = { fg = colors.red },
    
    -- UI highlights
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.bg_dark },
    Cursor = { fg = colors.bg, bg = colors.fg },
    CursorLine = { bg = colors.bg_highlight },
    CursorLineNr = { fg = colors.line_number_active },
    LineNr = { fg = colors.line_number },
    
    -- Selection
    Visual = { bg = colors.selection },
    VisualNOS = { bg = colors.selection },
    
    -- Pop-up menus
    Pmenu = { fg = colors.fg, bg = colors.bg_dark },
    PmenuSel = { fg = colors.fg, bg = colors.bg_highlight },
    PmenuSbar = { bg = colors.bg_dark },
    PmenuThumb = { bg = colors.fg_gutter },
    
    -- Search
    Search = { fg = colors.bg, bg = colors.blue },
    IncSearch = { fg = colors.bg, bg = colors.blue_light },
    
    -- Diagnostics
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue },
    DiagnosticHint = { fg = colors.green },
    
    -- Git highlighting
    DiffAdd = { fg = colors.green },
    DiffChange = { fg = colors.blue },
    DiffDelete = { fg = colors.red },
    DiffText = { fg = colors.fg },
  }

  -- Terminal colors
  local terminal_colors = {
    terminal_color_0 = colors.bg_dark,
    terminal_color_8 = colors.fg_gutter,
    
    terminal_color_1 = colors.red,
    terminal_color_9 = colors.red,
    
    terminal_color_2 = colors.green,
    terminal_color_10 = colors.green,
    
    terminal_color_3 = colors.yellow,
    terminal_color_11 = colors.yellow,
    
    terminal_color_4 = colors.blue,
    terminal_color_12 = colors.blue_light,
    
    terminal_color_5 = colors.purple,
    terminal_color_13 = colors.purple,
    
    terminal_color_6 = colors.cyan,
    terminal_color_14 = colors.cyan,
    
    terminal_color_7 = colors.fg,
    terminal_color_15 = colors.fg
  }

  -- Merge all highlights
  for group, settings in pairs(terminal_colors) do
    highlights[group] = { fg = settings }
  end

  local highlight_clear = vim.api.nvim_command('highlight clear')
  if vim.g.syntax_on then
      vim.api.nvim_command('syntax reset')
  end
  vim.o.termguicolors = true
  vim.g.colors_name = 'enterprise'

  -- Set highlights
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
