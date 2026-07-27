return {
  -- 主题插件：priority 必须高，lazy 必须 false
--  {
--    "folke/tokyonight.nvim",
--    lazy = false,
--    priority = 1000,
--    opts = {
--      style = "night",          -- night / storm / moon / day
--      transparent = false,       -- 想要透明背景改 true
--      terminal_colors = true,
--      styles = {
--        comments = { italic = true },
--        keywords = { italic = true },
--        functions = {},
--        variables = {},
--      },
--    },
--    config = function(_, opts)
--      require("tokyonight").setup(opts)
--      vim.cmd.colorscheme("tokyonight")
--    end,
--  },

  -- 备选：Catppuccin Mocha，想用就取消注释并把上面 tokyonight 的 colorscheme 行注释掉
    {
     "catppuccin/nvim",
     name = "catppuccin",
     lazy = false,
     priority = 1000,
     opts = { flavour = "mocha", transparent_background = false },
     config = function(_, opts)
       require("catppuccin").setup(opts)
       vim.cmd.colorscheme("catppuccin-mocha")
     end,
   },

  -- 顺手加个切换键：<leader>th 在 tokyonight 几个风格间循环
  --{
  --  "folke/tokyonight.nvim",
  --  keys = {
  --    {
  --      "<leader>th",
  --      function()
  --        local styles = { "night", "storm", "moon", "day" }
  --        local cur = vim.g.tokyonight_style or "night"
  --        local next = styles[(vim.fn.index(styles, cur) % #styles) + 1]
  --        vim.g.tokyonight_style = next
  --        require("tokyonight").setup({ style = next })
  --        vim.cmd.colorscheme("tokyonight")
  --        print("TokyoNight: " .. next)
  --      end,
  --      desc = "Cycle TokyoNight style",
  --    },
  --  },
  -- },
}
