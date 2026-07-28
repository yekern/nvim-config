return {
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit" },
    keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Lazygit" } },
    config = function()
      vim.g.lazygit_floating_window_use_plenary = 1
      vim.g.lazygit_floating_window_scaling_factor = 0.95
    end,
  },
}
