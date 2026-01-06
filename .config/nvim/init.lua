vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
vim.opt.laststatus = 1
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.listchars = { tab = '»·', trail = '■', nbsp = '␣' }
vim.opt.scrolloff = 10
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

vim.cmd([[
    filetype indent on
    filetype plugin on
]])

-- Auto jump to the last location when open a file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
            vim.api.nvim_win_set_cursor(0, mark)
        end
    end
})

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

require("lazy").setup({
    checker = { enabled = false },
    spec = {

        { 'folke/tokyonight.nvim' }, 

        { 'lewis6991/gitsigns.nvim' },

        {
            'stevearc/oil.nvim',
            lazy = false,
            config = function()
                require("oil").setup()
            end
        },

        {
            'nvim-telescope/telescope.nvim',
            -- tag = '0.1.8',
            branch = 'master',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-ui-select.nvim',
                { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            },
            config = function()
                require("telescope").setup {
                    extensions = {
                        fzf = {
                            fuzzy = true,                   -- false will only do exact matching
                            override_generic_sorter = true, -- override the generic sorter
                            override_file_sorter = true,    -- override the file sorter
                            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        },

                        -- sets vim.ui.select to telescope
                        ['ui-select'] = {
                            require('telescope.themes').get_dropdown(),
                        },
                    }
                }
                require('telescope').load_extension("ui-select")
                require('telescope').load_extension('fzf')

                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
                vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
                vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
                vim.keymap.set('n', '<M-x>', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
                vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
                vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
                vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
                vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
                vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
                vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[S] Find existing buffers' })
                vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch Commands' })

                --vim.keymap.set('n', 'gD', builtin.lsp_type_definitions, { desc = 'lsp type definitions' })
                vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'lsp definitions' })
                -- vim.keymap.set('n', 'gr', builtin.lsp_implementations, { desc = 'lsp implementation' })
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'lsp declaration' })
                vim.keymap.set('n', 'g0', builtin.lsp_document_symbols, { desc = 'lsp document symbos' })
                vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { desc = 'lsp workspace symbos' })
                vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'lsp document symbos' })

                -- Slightly advanced example of overriding default behavior and theme
                vim.keymap.set('n', '<leader>/', function()
                    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                        winblend = 10,
                        previewer = false,
                    })
                end, { desc = '[/] Fuzzily search in current buffer' })


                -- It's also possible to pass additional configuration options.
                --  See `:help telescope.builtin.live_grep()` for information about particular keys
                vim.keymap.set('n', '<leader>s/', function()
                    builtin.live_grep {
                        grep_open_files = true,
                        prompt_title = 'Live Grep in Open Files',
                    }
                end, { desc = '[S]earch [/] in Open Files' })

                -- Shortcut for searching your Neovim configuration files
                vim.keymap.set('n', '<leader>sn', function()
                    builtin.find_files { cwd = vim.fn.stdpath 'config' }
                end, { desc = '[S]earch [N]eovim files' })
            end
        },

        {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },

        { 'neovim/nvim-lspconfig' },

        {
            'saghen/blink.cmp',
            -- optional: provides snippets for the snippet source
            dependencies = { 'rafamadriz/friendly-snippets' },
            version = '1.*',
            opts = {
                keymap = { preset = 'default' },

                completion = { documentation = { auto_show = true } },

                signature = { enabled = true },

                -- Default list of enabled providers defined so that you can extend it
                -- elsewhere in your config, without redefining it, due to `opts_extend`
                sources = {
                    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                    providers = {
                        lazydev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },

                -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
                -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
                -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
                --
                -- See the fuzzy documentation for more information
                fuzzy = { implementation = "prefer_rust_with_warning" }
            },
            opts_extend = { "sources.default" }
        },
    }
})

vim.cmd( [[
colorscheme tokyonight
]])


-- lsp
vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    virtual_lines = false,
    signs = true,
    severity_sort = true,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
-- vim.lsp.enable("pyright")
vim.lsp.enable("ty")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("gopls")

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then return end

        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "clear highlight search" })

-- jk to escape
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("v", "jk", "<esc>")

-- Navigate buffers
vim.keymap.set("n", "<M-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>bpre<CR>")

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move test up and down
vim.keymap.set("v", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("v", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Navigate diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Open Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<M-p>", "<cmd>cpre<cr>")


vim.keymap.set('n', '<C-x>b', "<cmd>Telescope buffers<CR>")
vim.keymap.set('n', '<C-x><C-f>', "<cmd>Telescope find_files<CR>")
vim.keymap.set('n', '<C-x>k', ":bdelete")
