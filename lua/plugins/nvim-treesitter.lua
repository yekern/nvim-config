return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    -- 缺失的 parser 自动补装（需要 tree-sitter CLI，已装：/opt/homebrew/bin/tree-sitter）
    local wanted = {
      "lua", "python", "javascript", "typescript", "tsx", "html", "css", "json",
      "markdown", "markdown_inline", "go", "php", "vue", "blade", "yaml", "bash",
      "sql", "scss", "dockerfile", "ini", "make",
    }
    local installed = ts.get_installed("parsers")
    local missing = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, wanted)
    if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
      ts.install(missing)
    end

    -- 高亮 + 折叠：Neovim 0.12 的 treesitter 需要显式 start（插件已不再代劳）
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.wo.foldmethod = "expr"
          vim.wo.foldlevel = 99 -- 默认全部展开
        end
      end,
    })
  end,
}
