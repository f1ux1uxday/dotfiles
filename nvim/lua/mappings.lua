local map = vim.api.nvim_set_keymap

-- Mapleader
vim.g.mapleader = ','

-- Search
map('n', '<leader><Esc>', ':nohlsearch <cr>', {noremap = true})

-- Motion
map('n', 'j', 'gj', {noremap = false})
map('n', 'k', 'gk', {noremap = false})
map('n', '<C-j>', '<C-W>j', {noremap = false})
map('n', '<C-k>', '<C-W>k', {noremap = false})
map('n', '<C-h>', '<C-W>h', {noremap = false})
map('n', '<C-l>', '<C-W>l', {noremap = false})
map('n', '<leader>h', '<cmd>lua require"hop".hint_words()<CR>', {})

-- Split
map('n', '<C-s>', ':vsp<CR>', {noremap = false})

-- Floaterm
map('n', '<space>t', ':FloatermNew<CR>', {noremap = false})
map('n', '<space>tt', ':FloatermToggle<CR>', {noremap = false})

-- FM
map('n', '<leader>r', ':Ranger <cr>', {noremap = false})

-- FZF
map('n', '<space>fzf', ':FZF<CR>', {noremap = false})
map('n', '<leader>s', ':Ag<CR>', {noremap = false})

-- Telescope
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', {noremap = true})
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").command_history()<cr>', {noremap = true})
map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>', {noremap = true})
map('n', '<leader>fp', '<cmd>lua require("telescope.builtin").git_files()<cr>', {noremap = true})
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', {noremap = true})
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', {noremap = true})
map('n', '<leader>fm', '<cmd>lua require("telescope.builtin").man_pages()<cr>', {noremap = true})
map('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<cr>', {noremap = true})

-- Coc
