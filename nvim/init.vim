set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" source ~/.vimrc
lua require('plugins')
lua require('options')
lua require('ui')
lua require('mappings')

" Basic settings
" set viminfo='100,n$HOME/.vim/files/info/viminfo
" set t_Co=256
" set hidden
" set number
" set relativenumber
syntax on
filetype plugin indent on
" set history=200
" set encoding=utf8
" set cmdheight=1
" set updatetime=300
" set shortmess+=c
" set signcolumn=yes

" Tab/indent configuration
" set smarttab
" set expandtab
" set shiftwidth=2
" set tabstop=2
" set softtabstop=2

" Turn off backups and swap-file creation
set nobackup
set nowb
set nowritebackup
set noswapfile

" Set linebreak at 200 characters
" set lbr
" set tw=200

" Show current position
" set ruler
" set scrolloff=5

" Show matching brackets when selected
" set showmatch
" set mat=3

" Highlight search matches
" set hlsearch
" set incsearch
" nnoremap <silent> <Esc> :nohlsearch<CR>

" Set to autoread file when changed from outside
" set autoread

" set wildmenu
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.rar,*.tar,*.gz,*.deb,*.iso,*.jpg,*.jpeg,*.JPG,*.png,*.pdf,*.flac,*.FLAC,*.mp3,*.MP3,*.Mp3,*.mp4,*.plist,*/Storage*,*/Steam*,*/GOG,*.alc,*.aif,*.asd,*.adg,*.app,*.als,*/Pictures*,*.doc,*.docx,*.odt,*.m4a,*.wav,*.WAV,*.gif,*.mpg,*.mpeg,*.mov,*.m3u,*.ico,*.svg,*.key,*.kdbx,*.idx,*.nfo,*.NFO,*.avi,*.srt,*.mkv,*.sfv,*.cue,*.acf,*.smi,*.xcf,*.ess,*.DAT,*/musicLibrary*,*/movieLibrary*,*/torrents*,*/ggBack*,*node_modules*

" Sets leader keybinding to comma
" let mapleader = ','

" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk

" Move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Open new vertical split
" map <C-s> :vsp <cr>

" Plugins
" call plug#begin('~/.vim/plugs')

" Plug 'bluz71/vim-moonfly-colors'

" Plug 'arcticicestudio/nord-vim'

" Plug 'jiangmiao/auto-pairs'

" Plug 'windwp/nvim-autopairs'

" Plug 'jeetsukumaran/vim-buffergator'

" Plug 'Yggdroot/indentLine'

" Plug 'preservim/nerdcommenter'

" Plug 'vim-airline/vim-airline'

" Plug 'nvim-lualine/lualine.nvim'

" Plug 'kdheepak/tabline.nvim'

" Plug 'kyazdani42/nvim-web-devicons'

" Plug 'neoclide/coc.nvim'

" Plug 'voldikss/vim-floaterm'

" Plug 'pangloss/vim-javascript'

" Plug 'easymotion/vim-easymotion'

" Plug 'plasticboy/vim-markdown'

" Plug 'junegunn/fzf'

" Plug 'junegunn/fzf.vim'

" Plug 'sunjon/shade.nvim'

" Plug 'xiyaowong/nvim-transparent'

" Plug 'tpope/vim-fugitive'

" Plug 'tpope/vim-liquid'

" Plug 'mhinz/vim-startify'

" Plug 'posva/vim-vue'

" Plug 'SirVer/ultisnips'

" Plug 'honza/vim-snippets'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Plug 'nvim-lua/plenary.nvim'

" Plug 'nvim-telescope/telescope.nvim'

" Plug 'jparise/vim-graphql'

" Plug 'sainnhe/everforest'

" Plug 'Yggdroot/indentLine'

" Plug 'ethanholz/nvim-lastplace'

" call plug#end()

" Colors
" if (has("termguicolors"))
"   set termguicolors
" endif

" colorscheme everforest
" let g:everforest_transparent_background = 1

" Treesitter
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = {"css", ...}
"   highlight = {
"     enable = true,
"     disable = {},  -- list of language that will be disabled
"   },
" }
" EOF

" Telescope

" lua <<EOF
" require'telescope.builtin'.treesitter{
  " -- Optional
  " -- bufnr = Buffer number
" }
" EOF
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({}))<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <Leader>fc <cmd>lua require('telescope.builtin').command_history(require('telescope.themes').get_cursor({}))<cr>
" nnoremap <Leader>ft <cmd>lua require('telescope.builtin').treesitter{}<cr>
" nnoremap <Leader>fm <cmd>lua require('telescope.builtin').man_pages{}<cr>

" NERDCommenter
" let g:NERDTrimTrailingWhitespace = 1
" let g:NERDSpaceDelims = 1

" Airline configuration
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_theme="nord"

" Lualine configuration
" lua <<EOF
" require('lualine').setup {
  " options = {
    " icons_enabled = true,
    " theme = 'everforest',
    " component_separators = { left = '|', right = '|'},
    " section_separators = { left = '', right = ''},
    " disabled_filetypes = {},
    " always_divide_middle = true,
  " },
  " sections = {
    " lualine_a = {'mode'},
    " lualine_b = {'branch', 'diff', 'diagnostics'},
    " lualine_c = {'filename'},
    " lualine_c = {
      " {"diagnostics", sources = {"nvim_lsp"}},
      " function()
      " end,
    " },
    " lualine_x = {'encoding', 'fileformat', 'filetype'},
    " lualine_y = {'progress'},
    " lualine_z = {'location'}
  " },
  " inactive_sections = {
    " lualine_a = {},
    " lualine_b = {},
    " lualine_c = {'filename'},
    " lualine_x = {'location'},
    " lualine_y = {},
    " lualine_z = {}
  " },
  " tabline = {},
  " extensions = {}
" }
" EOF

" Tabline
" lua <<EOF
" require'tabline'.setup {
     " enable = true,
     " options = {
       " component_separators = {'|', '|'},
       " section_separators = {'', ''},
       " max_bufferline_percent = 66,
       " show_tabs_always = false,
       " show_devicons = true,
       " show_bufnr = false,
       " show_filename_only = true,
       " modified_italic = false
     " }
   " }
" EOF

" Shade
" lua <<EOF
" require'shade'.setup({
  " overlay_opacity = 50,
  " opacity_step = 1,
  " keys = {
    " brightness_up    = '<C-Up>',
    " brightness_down  = '<C-Down>',
    " toggle           = '<Leader>d',
  " }
" })
" EOF

" Transparent
" lua <<EOF
" require("transparent").setup({
 " enable = true, -- boolean: enable transparent
 " extra_groups = { -- table/string: additional groups that should be clear
   " -- In particular, when you set it to 'all', that means all avaliable groups

   " -- example of akinsho/nvim-bufferline.lua
   " --"BufferLineFill",
 " },
 " exclude = {
 " }, -- table: groups you don't want to clear
" })
" EOF

" Floaterm
" nmap <space>t :FloatermNew <cr>
" nmap <space>tt :FloatermToggle <cr>
" let g:floaterm_autoclose = 1
" let g:floaterm_position='center'
" let g:floaterm_wintype='floating'

" Auto Pairs
" let g:AutoPairsShortcutToggle='<leader>\'
" lua <<EOF
" require('nvim-autopairs').setup{}
" EOF

" Buffergator
" let g:buffergator_viewport_split_policy = 'B'
" let g:buffergator_hsplit_size = 10
" let g:buffergator_sort_regime = 'basename'

" Lastplace
" lua <<EOF
" EOF

" Indentline
" let g:indentLine_char= '|'

" Markdown
" let g:vim_markdown_folding_disabled = 1

" FZF settings
" let g:fzf_action = {'ctrl-s': 'vsplit'}

" let g:fzf_layout =
" \ {'window': {
" \   'width':1,
" \   'height':0.8}}

" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Constant'],
  " \ 'fg+':     ['fg', 'StatusLine'],
  " \ 'bg+':     ['fg', 'VertSplit'],
  " \ 'hl+':     ['fg', 'Constant'],
  " \ 'info':    ['fg', 'Keyword'],
  " \ 'gutter':  ['fg', 'Operator'],
  " \ 'border':  ['fg', 'Typedef'],
  " \ 'prompt':  ['fg', 'Label'],
  " \ 'pointer': ['fg', 'Type'],
  " \ 'marker':  ['fg', 'Operator'],
  " \ 'spinner': ['fg', 'Label']}

" nmap <space>fzf :FZF <CR>
" nmap <leader>s :Ag <CR>

" COC
let g:coc_disable_startup_warning = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>

" nmap <space>x :CocCommand explorer <cr>

" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<cr>
" Open git list
nnoremap <silent> <space>g  :<C-u>CocList --normal gstatus<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CocSnippets
inoremap <leader><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" JS
autocmd Filetype json
\ let g:vim_json_syntax_conceal = 0 |
\ let g:indentLine_setConceal = 0
