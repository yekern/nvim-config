return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = {
    sections = {
      lualine_b = {'branch', 'diff'}, -- 添加 branch 和 diff 模块
    }
  }
}
