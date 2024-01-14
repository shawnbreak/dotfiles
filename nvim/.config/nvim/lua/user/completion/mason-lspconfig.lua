require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "rust_analyzer", "pyright", "lua_ls", "gopls" },
})

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)

        local opts = {
          on_attach = require("user.completion.handlers").on_attach,
          capabilities = require("user.completion.handlers").capabilities,
        }

        if server == "jsonls" then
          local jsonls_opts = require("user.completion.settings.jsonls")
          opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
        end

        if server == "sumneko_lua" then
          local sumneko_opts = require("user.completion.settings.sumneko_lua")
          opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        end

        if server == "pyright" then
          local pyright_opts = require("user.completion.settings.pyright")
          opts = vim.tbl_deep_extend("force", pyright_opts, opts)
        end

        if server == "vuels" then
          local vuels_opts = require("user.completion.settings.vuels")
          opts = vim.tbl_deep_extend("force", vuels_opts, opts)
        end

        require("lspconfig")[server_name].setup(opts)
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["rust_analyzer"] = function ()
    --     require("rust-tools").setup {}
    -- end
}
