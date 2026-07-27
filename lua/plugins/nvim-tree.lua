return {
	"nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
	  "nvim-tree/nvim-web-devicons"
	},
    --  在这里直接绑定快捷键，省时省力
  keys = {
    -- { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" }, 
    -- 如果你也喜欢空格 + e 这种现代快捷键，可以解开下面这行的注释：
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
  },
  config = function()
      
    require("nvim-tree").setup({
      -- 你的其他 nvim-tree 基础配置...
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
    })

  end
}
