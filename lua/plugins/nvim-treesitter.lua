return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- 最新版不再使用 require("nvim-treesitter.configs").setup()
    -- 而是直接通过插件自带的 main 模块进行底层配置
    require("nvim-treesitter").setup({
      -- 确保安装你需要的全部语言解析器
      ensure_installed = { 
        "lua", "python", "javascript", "typescript", "html", "css", "json", "markdown",
        "go", "php", "vue","blade","markdown_inline" 
      },
      
      -- 开启语法高亮
      highlight = { enable = true },
      
      -- 开启基于 Tree-sitter 的智能缩进
      indent = { enable = true },
      
      -- 开启键盘增量选择
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",      -- 回车开始选择
          node_incremental = "<CR>",    -- 回车扩大选择范围
          scope_incremental = "<TAB>",   -- Tab 扩大到外层作用域
          node_decremental = "<BS>",    -- 退格键缩小选择范围
        },
      },
    })

    -- 开启基于 Tree-sitter 的代码折叠（最新版 Neovim 官方原生自带的折叠函数）
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    
    -- 默认不折叠所有代码（展开状态）
    vim.opt.foldlevel = 99
  end,
}

