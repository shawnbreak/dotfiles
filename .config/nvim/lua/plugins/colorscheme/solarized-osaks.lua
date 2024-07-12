return {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("solarized-osaka").setup({
        transparent = false, -- Enable this to disable setting the background color

    })

    vim.cmd[[colorscheme solarized-osaka]]
  end
}
