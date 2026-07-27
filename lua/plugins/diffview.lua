return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 需要图标支持
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- 开启增强高亮，体验更接近 VSCode
      view = {
        default = {
          layout = "diff2_horizontal", -- 水平分栏对比
        },
      },
       -- 1. 界面内快捷键：在左侧文件列表激活时有效
      keymaps = {
        file_panel = {
          { "n", "r", "<cmd>DiffviewRefresh<cr>", { desc = "刷新 Git 状态" } }, -- 默认是大写 R，这里改成了小写 r
        },
      },
    })
  end,
  -- 推荐绑定快捷键，方便随时审查 AI 的代码
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "打开 Git 审查界面" },
    { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "关闭 Git 审查界面" },
    { "<leader>gr", "<cmd>DiffviewRefresh<cr>", desc = "手动强制刷新 Diff 状态" }, -- 全局一键刷新
  }
}

