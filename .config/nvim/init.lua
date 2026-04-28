vim.g.mapleader = ' '
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.laststatus = 1
vim.o.completeopt = "menu,menuone,noselect,noinsert,fuzzy"

vim.pack.add({
    { src='https://github.com/nvim-mini/mini.pick' },
    { src='https://github.com/neovim/nvim-lspconfig' },
    { src='https://github.com/blazkowolf/gruber-darker.nvim' }
})

vim.cmd("colorscheme gruber-darker")
require("mini.pick").setup()

vim.lsp.enable("pyright")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("gopls")

vim.keymap.set("n", "<leader>o", ":Pick files<CR>")
vim.keymap.set("n", "<leader><leader>", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>hh", ":Pick help<CR>")
