return {
    {
        'akinsho/bufferline.nvim',
        enabled = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('bufferline').setup {
                options = {
                    mode = "tabs",  -- buffers, tabs
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
                },
            }
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    component_separators = '',
                    section_separators = '',
                }
            })
        end
    }

}
