return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  -- 在这里直接绑定 Tab 键切换标签页的快捷键
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个标签页" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个标签页" },
    { "<leader>bc", "<cmd>bdelete<cr>", desc = "关闭当前标签页" },
  },
  config = function() -- 💡 注意：这里是 Lua 语法，没有大括号 {}
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "nvim-tree",
            text = "File Explorer", -- 文件树上方的标题文字
            text_align = "center",
            separator = true,
          }
        }
      }
    })
  end, -- 💡 注意：这里用 end 结束函数
}

