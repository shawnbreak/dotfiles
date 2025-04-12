return {
  'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function(opts)
      require('onedark').setup {
          style = 'darker'
      }
      -- require('onedark').load()
    end
}
