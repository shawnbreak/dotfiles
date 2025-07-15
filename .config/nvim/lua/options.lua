-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.o.guifont = "Rec Mono Custom"

-- Make line numbers default
vim.opt.number = true
vim.opt.numberwidth = 2
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = false

-- signe column
vim.opt.signcolumn = "yes"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--  ⤶ U+2936 ARROW POINTING DOWNWARDS THEN CURVING LEFTWARDS
-- ↵ U+21B5 DOWNWARDS ARROW WITH CORNER LEFTWARDS
-- ⏎ U+23CE RETURN SYMBOL
-- ↲ U+21B2 DOWNWARDS ARROW WITH TIP LEFTWARDS
-- ↩ U+21A9 LEFTWARDS ARROW WITH HOOK
-- vim.opt.list = false
-- vim.opt.listchars = { tab = '»·', trail = '■', nbsp = '␣', eol = '↵' }op
vim.opt.listchars = { tab = '»·', trail = '■', nbsp = '␣'  }


-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = fasle

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true


-- treesitter fold method
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldcolumn = "0" -- 0 , 1, auto

vim.opt.suffixesadd = {""}


vim.opt.laststatus = 0
vim.cmd([[
    filetype indent on
    filetype plugin on
]])

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'gray', bold = true })


---------------- create set winbar autocmd --------------------
-- vim.cmd([[
-- augroup winbar
--   autocmd!
--   autocmd WinResized * exe winnr('$')>1 ? "set winbar=%=%m%f%=" : "set winbar="
-- augroup END
-- ]])

-- local winbar_augroup = vim.api.nvim_create_augroup("winbar", { clear = false })
-- vim.api.nvim_create_autocmd({"WinResized"}, {
--   command = "exe winnr('$')>1 ? \"set winbar=%=%m%f%=\" : \"set winbar=\"",
--   group = winbar_augroup
-- })
---------------- end create set winbar autocmd --------------------

-- auto change input method
if vim.loop.os_uname().sysname == "Linux" then
  vim.cmd([[
  augroup imselect
    autocmd InsertLeave * :silent !fcitx-remote -c
    autocmd BufCreate *  :silent !fcitx-remote -c
    autocmd BufEnter *  :silent !fcitx-remote -c
    autocmd BufLeave *  :silent !fcitx-remote -c
  augroup END
  ]])
end


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto jump to the last location when open a file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end
})
