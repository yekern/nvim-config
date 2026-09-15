return {
  -- ── 原地美化：render-markdown ─────────────────────
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "echasnovski/mini.icons",
    },
    opts = {
      render_modes = { "n", "v" }, -- 普通/可视模式渲染，插入模式不渲染
      completions = { lsp = { enabled = true } }, -- LSP 补全里的 Markdown 片段
      heading = { enabled = true, icons = { enabled = true } },
      code = { enabled = true, style = "full" }, -- 代码块完整渲染
      bullet = { enabled = true, icons = { enabled = true } },
      checkbox = { enabled = true, icons = { enabled = true } },
      table = { enabled = true, extend_mode = "full" },
      quote = { enabled = true, style = "full" },
    },
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", desc = "Markdown 渲染 开/关" },
    },
  },

  -- ── 浏览器/终端预览：glow ────────────────────────
  {
    "ellisonleao/glow.nvim",
    ft = { "markdown" },
    cmd = { "Glow" },
    keys = {
      { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown 预览" },
    },
    config = function()
      require("glow").setup({
        style = "dark", -- dark / light / auto
      })
    end,
  },
}
