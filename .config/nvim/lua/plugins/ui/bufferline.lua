return {
    'akinsho/bufferline.nvim',
    enabled = true,
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local bufferline = require('bufferline')
        bufferline.setup {
            options = {
                mode = "tabs", -- set to "tabs" to only show tabpages instead
                always_show_bufferline = false,
                numbers =  "none",
                -- close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
                close_command = "tabclose",       -- can be a string | function, | false see "Mouse actions"
                diagnostics =  "nvim_lsp",
                show_close_icon = false,
                show_tab_indicators = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer" ,
                        text_align = "left",
                        separator = true
                    }
                },
            }
        }
    end

}
