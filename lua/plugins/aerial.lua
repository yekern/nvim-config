return {
  "stevearc/aerial.nvim",
  opts = {
    backends = { "lsp", "treesitter" },
    layout = { min_width = 30, default_direction = "left" },
  },
  keys = {
    { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "代码大纲 开/关" },
  },
}
