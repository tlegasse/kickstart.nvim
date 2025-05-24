require('mini.base16').setup {
  palette = {
    base00 = '#121619', -- Background
    base01 = '#001141', -- Gutter, active line
    base02 = '#001d6c', -- Status bar, selected text
    base03 = '#0072c3', -- Text inactive
    base04 = '#d0e2ff', -- Status bar and active line text
    base05 = '#0f62fe', -- Objects, opreators and cursor
    base06 = '#000000', -- ???
    base07 = '#000000', -- ???
    base08 = '#78a9ff', -- Vars, params
    base09 = '#24a148', -- Values
    base0A = '#009d9a', -- Types
    base0B = '#bae6ff', -- String text
    base0C = '#be95ff', -- Brackets
    base0D = '#82cfff', -- Methods, functions
    base0E = '#ee5396', -- Warn
    base0F = '#0043ce', -- Punctianion, parens
  },
  use_cterm = true,
  plugins = {
    default = false,
    ['echasnovski/mini.nvim'] = true,
  },
}
