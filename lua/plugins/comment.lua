-- 注释：<leader>c 开关注释；原生 gcc / gc 依然可用
-- 注意：<Plug>(comment_toggle_linewise) 是 operator（需要接 motion），
-- 普通模式要用 ..._current（= gcc 用的那个），可视模式用 ..._visual
return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    { "<leader>c", "<Plug>(comment_toggle_linewise_current)", mode = "n", remap = true, desc = "注释/取消注释当前行" },
    { "<leader>c", "<Plug>(comment_toggle_linewise_visual)", mode = "x", remap = true, desc = "注释/取消注释选中内容" },
  },
}
