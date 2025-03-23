-- Colorscheme
vim.opt.termguicolors = true

require('dracula').setup({
  transparent_bg = true,
  overrides = {
    TelescopeNormal = { bg = 'none' },
    TelescopeBorder = { fg = '#BD93F9' },
    TelescopeSelection = { bg = '#FF79C6', fg = '#3E4452' },
    LineNr = { fg = '#7282B4' },
    Comment = { fg = '#7282B4' }
  },
})

vim.cmd[[colorscheme dracula]]

-- Lualine
local custom_theme = require'lualine.themes.dracula-nvim'
custom_theme.insert.c.bg = 'none'
custom_theme.normal.c.bg = 'none'
custom_theme.replace.c.bg = 'none'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_theme,
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    -- lualine_c = {
    --   {"diagnostics", sources = {"coc"}},
    --   function()
    --     return "%="
    --   end,
    --   "filename"
    -- },
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- Incline
local devicons = require 'nvim-web-devicons'
local incline_color_active = '#FF79C6'
local incline_color_inactive = '#BD93F9'

require('incline').setup {
  window = {
    padding = 0,
    margin = { horizontal = 0 },
    zindex = 1
  },
  highlight = {
    groups = {
      InclineNormal = {
        default = true,
        group = "LineNr"
      },
      InclineNormalNC = {
        default = true,
        group = "LineNr"
      }
    }
  },

  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    local ft_icon = devicons.get_icon_color(filename)
    local modified = vim.bo[props.buf].modified
    local content = function(color)
      return {
        { filename, gui = modified and 'bold,italic' or 'bold' },
        ft_icon and { ' ', ft_icon, ' ', guifg = color } or '',
        guifg = color
      }
    end

    if props.focused then
      return content(incline_color_active)
    end

    return content(incline_color_inactive)
  end,
}

-- Transparent
require("transparent").setup({
  groups = {
    'Normal',
    'NormalNC',
    'Comment',
    'Constant',
    'Special',
    'Identifier',
    'Statement',
    'PreProc',
    'Type',
    'Underlined',
    'Todo',
    'String',
    'Function',
    'Conditional',
    'Repeat',
    'Operator',
    'Structure',
    'LineNr',
    'NonText',
    'SignColumn',
    'CursorLine',
    'CursorLineNr',
    'StatusLine',
    'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
    "Pmenu",
    "Border",
    "Floaterm",
    "FloatermBorder",
    "NormalFloat"
  },
  exclude = {}
})
