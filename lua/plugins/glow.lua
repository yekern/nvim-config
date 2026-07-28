-- lua/plugins/markdown.lua
return {
  -- ── 原地美化：render-markdown ─────────────────────
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "md", "mkd" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- 必须有 treesitter 的 markdown parser
      "echasnovski/mini.icons",          -- 可选，没装就用 nvim-web-devicons
    },
    opts = {
      file_types = { "markdown", "md", "mkd" },
      render_modes = { "n", "v" },       -- 普通/可视模式渲染，插入模式不渲染
      completions = { lsp = { enabled = true } }, -- LSP 补全里的 Markdown 片段
      heading = { enabled = true, icons = { enabled = true } },
      code = { enabled = true, style = "full" }, -- 代码块完整渲染
      bullet = { enabled = true, icons = { enabled = true } },
      checkbox = { enabled = true, icons = { enabled = true } },
      table = { enabled = true, extend_mode = "full" },
      quote = { enabled = true, style = "full" },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },

  -- ── 终端分屏预览：glow ──────────────────────────
  {
    "ellisonleao/glow.nvim",
    ft = { "markdown", "md", "mkd" },
    cmd = { "Glow" }, -- 懒加载，只有 :Glow 时才加载
    keys = {
      { "<leader>mg", "<cmd>Glow<cr>", desc = "Glow MD 预览" },
    },
    config = function()
      require("glow").setup({
        style = "dark",          -- dark / light / auto
      })
    end,
  },
}
