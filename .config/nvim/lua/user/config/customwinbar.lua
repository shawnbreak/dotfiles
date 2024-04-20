M = {}
M.get_winbar = function()
  if string.match(vim.fn.expand("%"), "neo%-tree% filesystem") then
    return "%=%m %f %{%v:lua.require'nvim-navic'.get_location()%}"
    -- return ""
  elseif #vim.fn.expand("%") == 0 then
    return ""
  else
    return "%=%m %f %{%v:lua.require'nvim-navic'.get_location()%}"
  end
end

return M
