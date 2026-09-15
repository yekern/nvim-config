return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      timeoutlen = 300, -- 按完 <leader> 等 300ms 弹窗，设 0 立刻弹
      win = { border = "rounded", padding = { 1, 2 } },
      layout = { align = "center", spacing = 4 },
      icons = { group = "󰉃 " }, -- 没 nerd font 就删这行
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- 分组名（只是"目录"，不绑命令；每个键的说明由各自的 desc 决定）
      wk.add({
        { "<leader>b", group = "Buffer 缓冲区" },
        { "<leader>g", group = "Git 版本控制" },
        { "<leader>h", group = "帮助" },
        { "<leader>j", group = "Jump 跳转" },
        { "<leader>l", group = "LSP 代码智能" },
        { "<leader>m", group = "Markdown" },
        { "<leader>w", group = "Window 窗口" },
      })
    end,
  },
}
