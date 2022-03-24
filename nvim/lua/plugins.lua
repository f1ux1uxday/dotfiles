local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugs')

Plug 'frenzyexists/aquarium-vim'
-- Plug 'tjdevries/colorbuddy.vim'
-- Plug 'sainnhe/everforest'
Plug 'projekt0n/github-nvim-theme'
-- Plug 'bluz71/vim-moonfly-colors'
-- Plug 'arcticicestudio/nord-vim'
-- Plug 'Th3Whit3Wolf/onebuddy'
-- Plug 'pappasam/papercolor-theme-slim'
-- Plug 'shaunsingh/seoul256.nvim'
Plug 'rakr/vim-colors-rakr'
Plug 'xiyaowong/nvim-transparent'
Plug 'kyazdani42/nvim-web-devicons'

-- Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'is0n/fm-nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'sunjon/shade.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-liquid'
Plug 'plasticboy/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'posva/vim-vue'

Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'phaazon/hop.nvim'
Plug 'Yggdroot/indentLine'
Plug 'ethanholz/nvim-lastplace'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
-- Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.cmd['TSUpdate']})

vim.call('plug#end')

-- Autopairs
require('nvim-autopairs').setup{}

-- Comment
require('Comment').setup()

-- Hop
require('hop').setup()

-- FM
require('fm-nvim').setup{
	ui = {
		float = {
			-- Floating window border (see ':h nvim_open_win')
			border    = "single",
			float_hl  = "Normal",
			border_hl = "FloatBorder",
		}
	}
}

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
          -- ["<c-d>"] = "delete_buffer",
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
