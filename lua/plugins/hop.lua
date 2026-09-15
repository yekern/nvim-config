return {
  "smoka7/hop.nvim",
  opts = {
    hint_position = 3,
  },
  keys = {
    { "<leader>jw", function() require("hop").hint_words() end, mode = { "n", "x", "o" }, desc = "跳到某个单词" },
    { "<leader>jc", function() require("hop").hint_char2() end, mode = { "n", "x", "o" }, desc = "跳到任意两个字符" },
    { "<leader>jl", function() require("hop").hint_lines_skip_whitespace() end, mode = { "n", "x", "o" }, desc = "跳到某一行" },
  },
}
