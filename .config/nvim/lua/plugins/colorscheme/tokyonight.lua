return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function(opts)
        require("tokyonight").setup({
            transparent = true,
            styles = {
              sidebars = "transparent",
              -- floats = "transparent"
            }
        })
        -- vim.cmd([[colorscheme tokyonight]])


    vim.cmd([[colorscheme tokyonight]])

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
