local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- Shorten function name

local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- navigate line head and line end
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- jk to escape
keymap("i", "jk", "<esc>", opts)
keymap("v", "jk", "<esc>", opts)

-- Navitage tabs
keymap("n", "<TAB>", "gt", opts)
keymap("n", "<S-TAB>", "gt", opts)

-- next error
keymap("n", "cp", ":cpre<cr>", opts)
-- previous error
keymap("n", "cn", ":cnext<cr>", opts)


-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bpre<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move test up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move test up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Toggle laststatus 0, 1
-- keymap("n", "<leader>s", ":ToggleLastStatus<cr>", opts)
