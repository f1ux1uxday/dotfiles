local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugs')

Plug 'Mofiqul/dracula.nvim'
Plug 'scottmckendry/cyberdream.nvim'
Plug 'xiyaowong/nvim-transparent'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'neoclide/coc.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sunjon/shade.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'b0o/incline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mikavilpas/yazi.nvim'

Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-liquid'
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'

Plug 'christoomey/vim-tmux-navigator'
Plug 'phaazon/hop.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'Yggdroot/indentLine'
Plug 'ethanholz/nvim-lastplace'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

vim.call('plug#end')

-- Autopairs
require('nvim-autopairs').setup{}

-- Comment
require('Comment').setup()

-- Hop
require('hop').setup()

-- Lastplace
require('nvim-lastplace').setup{
  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
  lastplace_open_folds = true
}

-- Telescope
require("telescope").setup {
  defaults = {
    -- Your defaults config goes in here
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
    command_history = {
      theme = "cursor"
    }
  }
}

-- Treesitter
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = {},  -- list of language that will be disabled
  },
}
vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/hypr/conf/*"] = "hyprlang",
  }
})
