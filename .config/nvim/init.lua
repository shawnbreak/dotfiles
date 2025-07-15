-- Setting options
require("options")

-- Basic keymaps
require("keymaps")

if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    -- Install lazy.nvim plugin manager
    require("lazyinit")
end


