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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

local function default_colorscheme()
  vim.cmd([[colorscheme default]])
  vim.cmd([[hi SignColumn guibg=none]])
  vim.cmd([[hi Pmenu guibg=none]])
  vim.cmd([[hi LineNr guifg=#5c6370]])
end

local function tokyonight_colorscheme()
  -- vim.cmd([[colorscheme tokyonight]])
  vim.cmd([[colorscheme vscode]])
  vim.cmd([[hi LineNr guifg=#5c6370]])
  vim.cmd([[hi Statement gui=bold]])
  vim.cmd([[hi Type gui=bold]])
  vim.cmd([[hi Keyword gui=bold]])
  vim.cmd([[hi Special gui=bold]])
  vim.cmd([[hi Operator gui=bold]])
  vim.cmd([[hi @keyword gui=bold]])
  -- vim.cmd([[hi @keyword.conditional gui=bold]])
  -- vim.cmd([[hi @keyword.repeat gui=bold]])
  vim.cmd([[hi @type gui=bold]])
  vim.cmd([[hi @type.builtin gui=bold]])
end

tokyonight_colorscheme()

vim.opt.laststatus = 3

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

-- vim.api.nvim_create_user_command("ToggleLastStatus",
--   function()
--     if vim.opt.laststatus._value == 2 then
--       vim.opt.laststatus = 0
--     else
--       vim.opt.laststatus = 2
--     end
--   end,
  -- {})
