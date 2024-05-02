-- Set keymap function
local function keymap(mode, lhs, rhs, opts)
  local default_opts = { noremap = true, silent = true }
  local final_opts = {}
  if opts ~= nil then
    final_opts = vim.tbl_extend("force", default_opts, opts)
  else
    final_opts = default_opts
  end
  -- vim.api.nvim_set_keymap(mode, lhs, rhs, default_opts)
  vim.keymap.set(mode, lhs, rhs, final_opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {}

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlight search" })

-- navigate line head and line end
keymap("n", "H", "^", { desc = "jump to line head" })
keymap("n", "L", "$", { desc = "jump to line end" })
keymap("v", "H", "^", { desc = "jump to line head" })
keymap("v", "L", "$", { desc = "jump to line end" })

-- jk to escape
keymap("i", "jk", "<esc>")
keymap("v", "jk", "<esc>")

-- Navitage tabs
keymap("n", "<TAB>", "gt")
keymap("n", "<S-TAB>", "gt")

-- next error
keymap("n", "cp", ":cpre<cr>", { desc = "quickfix previous" })
-- previous error
keymap("n", "cn", ":cnext<cr>", { desc = "quickfix next" })

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


keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })



-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

