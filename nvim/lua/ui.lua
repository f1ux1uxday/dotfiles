-- Colorscheme
-- require('colorbuddy').colorscheme('onebuddy')
-- vim.cmd 'colorscheme onebuddy'
-- vim.g.colors_name = 'PaperColorSlim'
-- vim.g.aquarium_style = 'light'
-- vim.g.aqua_transparency = true
-- vim.opt.background = 'light'
-- vim.g.everforest_transparent_background = true
vim.opt.termguicolors = true

require("github-theme").setup({
  theme_style = "light",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "yellow", error = "#ff0000"},

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})

-- Lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'github',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
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

-- Tabline
require'tabline'.setup {
  enable = true,
  options = {
    component_separators = {'|', '|'},
    section_separators = {'', ''},
    max_bufferline_percent = 66,
    show_tabs_always = false,
    show_devicons = true,
    show_bufnr = false,
    show_filename_only = true,
    modified_icon = "+ ",
    modified_italic = false
  }
}

-- Transparent
require("transparent").setup({
 enable = true,
 extra_groups = {
    "Border",
    "Floaterm",
    "FloatermBorder"
 },
 exclude = {}
})
