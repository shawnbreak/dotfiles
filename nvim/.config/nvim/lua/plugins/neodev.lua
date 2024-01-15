return {
  "folke/neodev.nvim",
  config = function()
    require("neodev").setup({

    })
  end,
  dependencies = {
    'neovim/nvim-lspconfig',
  }
}
