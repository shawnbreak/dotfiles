
# omni completion

vim 内置的补全功能

```vim
:help ins-completion
```

```lua
-- 不默认选中第一个，支持模糊搜索
vim.opt.completeopt = "menu,menuone,noselect,noinsert,fuzzy"
-- 弹框的边框
vim.opt.winborder = "rounded"
```

Ctrl-y 选中
K 查看文档

1. Whole lines						|i_CTRL-X_CTRL-L|
2. keywords in the current file				|i_CTRL-X_CTRL-N|
3. keywords in 'dictionary'				|i_CTRL-X_CTRL-K|
4. keywords in 'thesaurus', thesaurus-style		|i_CTRL-X_CTRL-T|
5. keywords in the current and included files		|i_CTRL-X_CTRL-I|
6. tags							|i_CTRL-X_CTRL-]|
7. file names						|i_CTRL-X_CTRL-F|
8. definitions or macros				|i_CTRL-X_CTRL-D|
9. Vim command-line					|i_CTRL-X_CTRL-V|
10. User defined completion				|i_CTRL-X_CTRL-U|
11. omni completion					|i_CTRL-X_CTRL-O|
12. Spelling suggestions				|i_CTRL-X_s|
13. keywords in 'complete'				|i_CTRL-N| |i_CTRL-P|


# vim.diagnostic

These diagnostic keymaps are created unconditionally when Nvim starts:
- `]d` jumps to the next diagnostic in the buffer. |]d-default|
- `[d` jumps to the previous diagnostic in the buffer. |[d-default|
- `]D` jumps to the last diagnostic in the buffer. |]D-default|
- `[D` jumps to the first diagnostic in the buffer. |[D-default|
- `<C-w>d` shows diagnostic at cursor in a floating window. |CTRL-W_d-default|

# quickfix

copen
cclose
cpre
cdo
