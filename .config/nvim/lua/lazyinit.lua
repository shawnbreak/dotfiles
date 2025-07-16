-- Auto install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("plugins")
require("lazy").setup({
  require("plugins.colorscheme.tokyonight"),
  require("plugins.colorscheme.onedark"),
  require("plugins.colorscheme.catppuccin"),
  require("plugins.colorscheme.kanagawa"),

  require("plugins.ui.lualine"),
  require("plugins.ui.bufferline"),
  -- require("plugins.ui.noice"),
  -- require("plugins.ui.dressing"),

  -- require("plugins.editor.comment"),
  -- require("plugins.editor.todo-comments"),
  -- require("plugins.editor.autopairs"),
  -- require("plugins.editor.colorizer"),
  -- require("plugins.editor.autotag"),
  require("plugins.editor.oil"),
  require("plugins.editor.trouble"),
  require("plugins.editor.gitsigns"),

  -- require("plugins.editor.neorg"),
  -- require("plugins.editor.cscope"),
  -- require("plugins.editor.harpoon"),

  -- require("plugins.editor.neotree"),
  -- require("plugins.editor.nvimtree"),

  require("plugins.editor.whichkey"),

  require("plugins.editor.telescope"),

  require("plugins.editor.render-markdown"),

  require("plugins.editor.treesitter"),
  -- require("plugins.editor.illumincate"),
  -- require("plugins.editor.toggleterm"),
  -- require("plugins.editor.hardtime"), -- hint for shortcut key
  -- require("plugins.editor.neoscroll"),
  -- require("plugins.editor.markdownpreview"),
  -- require("plugins.editor.headline"), --  markdonw headline
  -- require("plugins.editor.indent-blankline"),
  -- require("plugins.editor.smart-split"),
  -- require("plugins.editor.leap"),
  -- require("plugins.editor.flash"),


  require("plugins.lsp.lspconfig"),
  -- require("plugins.lsp.lspsaga"),
  -- require("plugins.lsp.cmp"),
  require("plugins.lsp.blink"),
  -- require("plugins.lsp.conform"),
  -- require("plugins.lsp.lint"),
  -- require("plugins.debug"),

})

vim.cmd("colorscheme kanagawa")

vim.cmd([[
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight CursorLineNr guibg=NONE ctermbg=NONE
]])

vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

