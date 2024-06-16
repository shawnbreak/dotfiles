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
  -- require("plugins.colorscheme.vscode"),
  -- require("plugins.colorscheme.default"),
  -- require("plugins.colorscheme.tokyonight"),
  -- require("plugins.colorscheme.kanagawa"),
  require("plugins.colorscheme.onedark"),

  require("plugins.ui.lualine"),
  require("plugins.ui.bufferline"),
  -- require("plugins.ui.noice"),
  require("plugins.ui.dressing"),

  require("plugins.editor.comment"),
  require("plugins.editor.todo-comments"),
  require("plugins.editor.autopairs"),

  require("plugins.editor.neorg"),
  require("plugins.editor.cscope"),
  require("plugins.editor.harpoon"),

  require("plugins.editor.neotree"),
  -- require("plugins.editor.nvimtree"),
  require("plugins.editor.trouble"),
  require("plugins.editor.gitsigns"),
  require("plugins.editor.whichkey"),
  require("plugins.editor.telescope"),
  require("plugins.editor.colorizer"),
  require("plugins.editor.treesitter"),
  require("plugins.editor.illumincate"),
  require("plugins.editor.autotag"),
  require("plugins.editor.oil"),


  require("plugins.lsp.lspconfig"),
  require("plugins.lsp.lspsaga"),
  require("plugins.lsp.cmp"),
  require("plugins.lsp.conform"),
  require("plugins.lsp.lint"),
  require("plugins.debug"),

})
