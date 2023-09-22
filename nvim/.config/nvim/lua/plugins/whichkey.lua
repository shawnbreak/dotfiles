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
        n = {"<cmd>Neotree toggle<cr>", "Toggle neotree"},
        f =  {
            name = "Telescope",
            f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" }, -- create a binding with label
            b = { "<cmd>Telescope buffers<cr>", "Buffers" }, -- create a binding with label
            h = { "<cmd>Telescope help_tags<cr>", "Help Tags" }, -- create a binding with label
        }
    }
      })
    end,
}
