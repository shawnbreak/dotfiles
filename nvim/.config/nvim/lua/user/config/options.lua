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
vim.opt.signcolumn = "yes"
vim.o.termguicolors = true
-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.winbar = "%=%m %f %{%v:lua.require'nvim-navic'.get_location()%}"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.opt.laststatus = 3

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'white', bold = true })

