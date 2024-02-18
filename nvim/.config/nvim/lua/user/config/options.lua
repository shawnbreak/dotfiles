-- :help options
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = ""
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.mouse = "a"

-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.opt.winbar = "%=%m %f %{%v:lua.require'nvim-navic'.get_location()%}"
vim.opt.winbar = "%{%v:lua.require'user.config.customwinbar'.get_winbar()%}"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.cmd([[colorscheme default]])
vim.cmd([[hi SignColumn guibg=none]])

-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[hi Statement gui=bold]])
-- vim.cmd([[hi Type gui=bold]])
-- vim.cmd([[hi Keyword gui=bold]])
-- vim.cmd([[hi Special gui=bold]])
-- vim.cmd([[hi Operator gui=bold]])
-- vim.cmd([[hi @keyword gui=bold]])
-- vim.cmd([[hi @keyword.conditional gui=bold]])
-- vim.cmd([[hi @keyword.repeat gui=bold]])
-- vim.cmd([[hi @type gui=bold]])
-- vim.cmd([[hi @type.builtin gui=bold]])

vim.opt.laststatus = 3

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'gray', bold = true })

