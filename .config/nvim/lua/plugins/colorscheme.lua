return {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      enabled = false,
      priority = 1000,
      opts = {
            transparent_background = false, -- disables setting the background color.
      }
    },
    {
      "rebelot/kanagawa.nvim",
      priority = 1000,
      enabled = false,
      opts ={
        transparent = true
      }
    },
    {
      'navarasu/onedark.nvim',
        lazy = false,
        priority = 1000,
        enabled = false,
        config = function(opts)
          require('onedark').setup {
              style = 'darker'
          }
          -- require('onedark').load()
        end
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        enabled = true,
        opts = {
          transparent = false, -- Enable this to disable setting the background color
        }

        -- vim.cmd([[colorscheme tokyonight]])
        -- vim.cmd([[colorscheme tokyonight]])
        -- vim.cmd([[hi LineNr guifg=#5c6370]])
        -- vim.cmd([[hi Statement gui=bold]])
        -- vim.cmd([[hi Type gui=bold]])
        -- vim.cmd([[hi Keyword gui=bold]])
        -- vim.cmd([[hi Special gui=bold]])
        -- vim.cmd([[hi Operator gui=bold]])
        -- vim.cmd([[hi @keyword gui=bold]])
        -- -- vim.cmd([[hi @keyword.conditional gui=bold]])
        -- -- vim.cmd([[hi @keyword.repeat gui=bold]])
        -- vim.cmd([[hi @type gui=bold]])
        -- vim.cmd([[hi @type.builtin gui=bold]])
        -- vim.cmd([[hi LspInlayHint guifg=#5c6370]])
        -- vim.cmd([[hi WhiteSpace guifg=#5c6370]])

        -- vim.api.nvim_set_hl(0, 'WinSeparator', { fg = 'gray', bold = true })
    }

}
