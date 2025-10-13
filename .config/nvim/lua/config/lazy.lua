-- Auto install lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
    spec = {
        { import = "plugins" }
    },
    checker = { enabled = true },
    install = { colorscheme = { "habamax" } },
})

vim.cmd("colorscheme tokyonight")

-- vim.cmd([[
--   highlight LineNr guibg=NONE ctermbg=NONE
--   highlight CursorLineNr guibg=NONE ctermbg=NONE
-- ]])
--
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
