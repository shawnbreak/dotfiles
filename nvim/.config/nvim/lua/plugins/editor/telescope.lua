return {
  'nvim-telescope/telescope.nvim',
  -- or                              , branch = '0.1.1',
  dependencies = { 
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",
          config = function()
            require("telescope").load_extension("fzf")
          end,
  },
  config = function()
    require("telescope").setup {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          -- prompt_position = "top"
        }
      },
      -- pickers = {
      --   find_files = {
      --     theme = "dropdown",
      --   }
      -- },
      --
      extensions = {
        fzf = {
          fuzzy = true,               -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    require("telescope").load_extension('fzf');
  end
}
