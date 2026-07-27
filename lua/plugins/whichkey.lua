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

      -- 分组名（只起"目录"作用，不绑命令）
      wk.add({
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code/Comment" },
        { "<leader>f", group = "File/Find" },
        { "<leader>g", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>t", group = "Tree/Toggle" },
        { "<leader>h", group = "Hunk (Gitsigns)" },
      })
    end,
  },
}
