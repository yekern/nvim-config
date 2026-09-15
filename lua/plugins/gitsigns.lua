return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
  },
  keys = {
    { "]c", function() require("gitsigns").nav_hunk("next") end, desc = "下一个改动块" },
    { "[c", function() require("gitsigns").nav_hunk("prev") end, desc = "上一个改动块" },
    { "<leader>gs", ":Gitsigns stage_hunk<CR>", mode = { "n", "v" }, desc = "暂存改动块" },
    { "<leader>gr", ":Gitsigns reset_hunk<CR>", mode = { "n", "v" }, desc = "撤销改动块" },
    { "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "取消暂存改动块" },
    { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "预览改动块" },
    { "<leader>gb", function() require("gitsigns").toggle_current_line_blame() end, desc = "当前行 blame" },
    { "<leader>gf", function() require("gitsigns").diffthis() end, desc = "查看本文件 diff" },
    { "<leader>gS", function() require("gitsigns").stage_buffer() end, desc = "暂存整个文件" },
    { "<leader>gR", function() require("gitsigns").reset_buffer() end, desc = "撤销整个文件的改动" },
  },
}
