return {
  "stevearc/conform.nvim", opts = {},
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        c = { "clang-format" },
        json = { "jq" }
      },
      -- format_on_save = {
      --   -- these options will be passed to conform.format()
      --   timeout_ms = 500,
      --   lsp_fallback = true,
      -- },
    })
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   pattern = "*",
    --   callback = function(args)
    --     require("conform").format({ bufnr = args.buf })
    --   end,
    vim.api.nvim_create_user_command("FormatRange", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
    vim.api.nvim_create_user_command("Format", function(args)
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      local bufnr = vim.api.nvim_get_current_buf()
      require("conform").format({ async = true, lsp_fallback = true, bufnr=bufnr })
    end, { range = true })
  end,
}
