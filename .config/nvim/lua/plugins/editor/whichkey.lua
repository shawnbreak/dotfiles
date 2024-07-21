return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
    local wk = require("which-key")
    require('which-key').setup()
    wk.add({
      { "<leader>s", group = "[S]earch" },
      { "<leader>c", group = "[C]ode" },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>t", group = "[T]rouble" },
      { "<leader>h", group = "Git [H]unk" },
      { "<leader>n", "<cmd>Neotree toggle<cr>",  desc = 'Toggle neotree' },
      { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = 'Lspsaga Outline' }
    })

    -- Document existing key chains
    -- require('which-key').register {
    --   ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    --   ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    --   ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    --   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    --   ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    --   ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    --   ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
    -- }
    -- visual mode
    -- require('which-key').register({
    --   ['<leader>h'] = { 'Git [H]unk' },
    -- }, { mode = 'v' })


    -- wk.register({
    --   ["<leader>"] = {
    --     -- n = {'<cmd>lua require("neo-tree.command").execute({ toggle = true, dir = "./" })<cr>', "Toggle neotree"},
    --     n = { "<cmd>Neotree toggle<cr>", "Toggle neotree" },
    --     o = { "<cmd>Lspsaga outline<cr>", "Lspsaga Outlines" },
    --     -- n = {"<cmd>NvimTreeToggle<cr>", "Toggle neotree"},
    --     t = {
    --       name = "Trouble",
    --       e = { "<cmd>Trouble document_diagnostics<cr>", "document diagnostics" },
    --       a = { "<cmd>Trouble workspace_diagnostics<cr>", "document diagnostics" },
    --
    --     }
    --   }
    -- })
  end,
}
