return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*", -- 0.1.8 最新 tag，不追分支
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep 内容" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      { "<leader>fs", "<cmd>Telescope treesitter<cr>", desc = "Symbols" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          -- ✅ 正确路径：关掉预览里的 Treesitter 高亮，避开 ft_to_lang
          preview = {
            treesitter = false,
          },
          layout_strategy = "horizontal",
          layout_config = { horizontal = { preview_width = 0.55 } },
          prompt_prefix = "🔍 ",
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
