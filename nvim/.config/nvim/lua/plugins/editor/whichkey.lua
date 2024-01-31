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
    wk.register({
      ["<leader>"] = {
        -- n = {'<cmd>lua require("neo-tree.command").execute({ toggle = true, dir = "./" })<cr>', "Toggle neotree"},
        n = { "<cmd>Neotree toggle<cr>", "Toggle neotree" },
        -- n = {"<cmd>NvimTreeToggle<cr>", "Toggle neotree"},
        f = {
          name = "Telescope",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },         -- create a binding with label
          g = { "<cmd>Telescope live_grep<cr>", "Live grep" },          -- create a binding with label
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },              -- create a binding with label
          h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },          -- create a binding with label
          d = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },      -- create a binding with label
          m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },          -- create a binding with label
          o = { "<cmd>Telescope vim_options<cr>", "Vim options" },      -- create a binding with label
          a = { "<cmd>Telescope autocommands<cr>", "auto commands" },   -- create a binding with label
        },
        t = {
          name = "Trouble",
          e = { "<cmd>Trouble document_diagnostics<cr>", "document diagnostics" },
          a = { "<cmd>Trouble workspace_diagnostics<cr>", "document diagnostics" },

        }
      }
    })
  end,
}
