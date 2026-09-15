return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个 Buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个 Buffer" },
    {
      "<leader>bc",
      function()
        -- 在 tree 窗口里按关闭，直接切回编辑区而不是删 tree
        -- 注意：nvim-tree 的 buffer filetype 是 "NvimTree"（大小写不固定，统一转小写比较）
        if vim.bo.filetype:lower() == "nvimtree" then
          vim.cmd("wincmd l") -- 树在左侧：关闭时往右回到编辑区
        else
          vim.cmd("bdelete")
        end
      end,
      desc = "关闭当前 Buffer",
    },
    { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "关闭左侧 Buffer" },
    { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "关闭右侧 Buffer" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他 Buffer" },
  },
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        -- 让 bufferline 忽略 nvimtree 的 buffer
        exclude = function(bufnr)
          return vim.bo[bufnr].filetype:lower() == "nvimtree"
        end,
        auto_select_buffer = true,
      },
    })
  end,
}
