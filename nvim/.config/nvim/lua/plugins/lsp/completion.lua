return {
  'hrsh7th/nvim-cmp',
  enabled = true,
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',

    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- For vsnip users.
    -- 'hrsh7th/cmp-vsnip',
    -- 'hrsh7th/vim-vsnip',

    -- For luasnip users.
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    "onsails/lspkind.nvim",

    "williamboman/nvim-lsp-installer",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'folke/neodev.nvim'
  },

  lazy = false,
  config = function()
    require("user.completion")
  end
}
