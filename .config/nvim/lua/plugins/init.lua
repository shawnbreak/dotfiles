-- local colorscheme = require("plugins.colorscheme")

local home_dir = vim.fn.expand("$HOME/.config/nvim/")
local plugins_dir = home_dir .. "lua/plugins/"

local sub_mod = {}

local function require_all(directory)
    local files = vim.fn.readdir(directory)  -- Assuming you're using Neovim's vim.fn for directory listing
    if not files then return end

    for _, file in ipairs(files) do
        if file:match("%.lua$") then
            -- local module_name = file:gsub("%.lua$", "")
            local module_abs_path = directory .. '/' .. file
            local module_path = string.gsub(module_abs_path, home_dir, "")
            local no_ext = string.gsub(module_path, ".lua$", "")
            local no_prefix = string.gsub(no_ext, "lua/", "")
            local result = string.gsub(no_prefix, "/", ".")
            local p_module = require(result)
            table.insert(sub_mod, p_module)
        end
    end
end

-- Function to require all Lua files in a directory
local function require_directory(directory)
    local files = vim.fn.readdir(directory)  -- Assuming you're using Neovim's vim.fn for directory listing
    if not files then
      return end

    for _, file in ipairs(files) do
        if vim.fn.isdirectory(directory .. file) == 1 then
          require_all(directory .. file)
        end
    end
end

require_directory(plugins_dir)

return sub_mod

