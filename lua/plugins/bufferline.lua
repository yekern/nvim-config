return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  lazy = false,
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个标签页" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个标签页" },
    { "<leader>bc", function()
      -- 在 tree 窗口里按关闭，直接切回编辑区而不是删 tree
      if vim.bo.filetype == "nvimtree" then
        vim.cmd("wincmd h")
      else
        vim.cmd("bdelete")
      end
    end, { desc = "关闭 Buffer" } },
    { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick Buffer" },
  },
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "nvimtree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          }
        },
        -- ✅ 关键：让 bufferline 忽略 nvimtree 的 buffer
        exclude = function(bufnr)
          return vim.bo[bufnr].filetype == "nvimtree"
        end,
        auto_select_buffer = true,
      }
    })
  end,
}
