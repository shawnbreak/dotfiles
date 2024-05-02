return {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      },
      diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
        },
    }
  }
}
