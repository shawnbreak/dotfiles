return {
    'nvim-telescope/telescope.nvim',
-- or                              , branch = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require("telescope").setup{
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

        }
      end
}
