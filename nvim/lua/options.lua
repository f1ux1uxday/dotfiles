-- General Settings
vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.history = 200
vim.opt.encoding = 'utf8'
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
-- vimp.opt.shortmess
vim.opt.signcolumn = 'yes'
vim.opt.lbr = true
vim.opt.tw = 200
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.showmatch = true
vim.opt.mat = 3
vim.opt.autoread = true

-- Tab / Indent
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.g.indentLine_char = '|'

-- Backup / Swap
-- vim.opt.nobackup = true
-- vim.opt.nowb = true
-- vim.opt.nowritebackup = true
-- vim.opt.noswapfile = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildignore = [[
  */tmp/*,*.so,*.swp,*.zip,*.rar,*.tar,*.gz,*.deb,*.iso,*.jpg,*.jpeg,*.JPG,*.png,*.pdf,*.flac,
  *.FLAC,*.mp3,*.MP3,*.Mp3,*.mp4,*.plist,*/Storage*,*/Steam*,*/GOG,*.alc,*.aif,*.asd,*.adg,*.app,
  *.als,*/Pictures*,*.doc,*.docx,*.odt,*.m4a,*.wav,*.WAV,*.gif,*.mpg,*.mpeg,*.mov,*.m3u,*.ico,
  *.svg,*.key,*.kdbx,*.idx,*.nfo,*.NFO,*.avi,*.srt,*.mkv,*.sfv,*.cue,*.acf,*.smi,*.xcf,*.ess,
  *.DAT,*/musicLibrary*,*/movieLibrary*,*/torrents*,*/ggBack*,*node_modules*
]]

-- Statusline

-- Floaterm
vim.g.floaterm_autoclose = 1
vim.g.floaterm_position = 'center'
vim.g.floaterm_wintype = 'floating'

-- Comments
vim.g.NERDTrimTrailingWhitespace = true
vim.g.NERDSpaceDelims = true

-- Markdown
vim.g.vim_markdown_folding_disabled = true
