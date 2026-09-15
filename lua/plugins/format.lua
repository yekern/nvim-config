-- 格式化：优先用项目里的工具（Pint / Prettier / gofmt），没有就回退 LSP
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "格式化当前文件",
    },
  },
  opts = {
    formatters_by_ft = {
      php = { "pint" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      vue = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      go = { "gofmt" },
    },
  },
}
