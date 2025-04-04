return {
  'Mofiqul/vscode.nvim',
  lazy = false,
  priority = 1000,
  enabled = true,
  config = function(opts)
    local c = require('vscode.colors').get_colors()
    require('vscode').setup({
      -- Alternatively set style in setup
      -- style = 'light'

      -- Enable transparent background
      transparent = true,

      -- Enable italic comment
      italic_comments = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {
        vscLineNumber = '#FFFFFF',
      },

      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      }
    })

    -- require('vscode').load()

    vim.cmd([[colorscheme vscode]])

    vim.cmd([[hi LineNr guifg=#5c6370]])
    vim.cmd([[hi Statement gui=bold]])
    vim.cmd([[hi Type gui=bold]])
    vim.cmd([[hi Keyword gui=bold]])
    vim.cmd([[hi Special gui=bold]])
    vim.cmd([[hi Operator gui=bold]])
    vim.cmd([[hi @keyword gui=bold]])
    -- vim.cmd([[hi @keyword.conditional gui=bold]])
    -- vim.cmd([[hi @keyword.repeat gui=bold]])
    vim.cmd([[hi @type gui=bold]])
    vim.cmd([[hi @type.builtin gui=bold]])
    vim.cmd([[hi LspInlayHint guifg=#5c6370]])
    vim.cmd([[hi WhiteSpace guifg=#5c6370]])
  end

}
