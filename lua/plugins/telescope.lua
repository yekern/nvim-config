return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*", -- 0.1.8 最新 tag，不追分支
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "全局搜索内容" },
      { "<leader>s", "<cmd>Telescope lsp_document_symbols<cr>", desc = "当前文件符号" },
      { "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "最近打开的文件" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "切换 Buffer" },
      { "<leader>le", "<cmd>Telescope diagnostics<cr>", desc = "诊断列表" },
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "快捷键速查" },
      { "<leader>hh", "<cmd>Telescope help_tags<cr>", desc = "Neovim 帮助文档" },
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
