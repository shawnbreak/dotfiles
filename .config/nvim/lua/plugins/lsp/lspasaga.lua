return {
  'nvimdev/lspsaga.nvim',
  enabled = true,
  config = function()
      require('lspsaga').setup({
        outline = {
            auto_preview = false,
            detail = true,
            layout = "normal" -- normal, float
        }
      })
  end,
  dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
  }
}
