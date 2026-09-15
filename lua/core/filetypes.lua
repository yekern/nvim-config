-- 默认不认识的扩展名，补上文件类型（否则没有高亮、也没有 LSP）
vim.filetype.add({
  extension = {
    uvue = "vue", -- uni-app x 组件（按 Vue SFC 处理）
    uts = "typescript", -- uni-app x 的 UTS 是 TS 超集
  },
})
