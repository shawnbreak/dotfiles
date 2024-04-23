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
        a = { "<cmd>Lspsaga outline<cr>", "Lspsaga Outlines" },
        -- n = {"<cmd>NvimTreeToggle<cr>", "Toggle neotree"},
        f = {
          name = "Telescope",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
          b = { "<cmd>Telescope buffers<cr>", "Buffers" },
          h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
          e = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
          m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
          -- o = { "<cmd>Telescope vim_options<cr>", "Vim options" },
          i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Telescope lsp incoming calls" },
          o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Telescope lsp outcoming calls" },
          p = { "<cmd>Telescope lsp_implementations<cr>", "Telescope lsp implementations" },
          a = { "<cmd>Telescope autocommands<cr>", "auto commands" },
          r = { "<cmd>Telescope resume<cr>", "Telescope resume" },
          x = { "<cmd>Telescope lsp_references<cr>", "Telescope lsp references" },
          d = { "<cmd>Telescope lsp_document_symbols<cr>", "Telescope lsp document symbols" },
          s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Telescope lsp workspace symbples" },
          t = { "<cmd>Telescope treesitter<cr>", "Telescope treesitter" },
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
