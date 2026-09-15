-- Git 改动审查界面（<leader>gd 一键开/关）
return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    {
      "<leader>gd",
      function()
        if require("diffview.lib").get_current_view() then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Git 改动审查 开/关",
    },
  },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true, -- 增强高亮，体验更接近 VSCode
      view = {
        default = {
          layout = "diff2_horizontal", -- 水平分栏对比
        },
      },
      keymaps = {
        file_panel = {
          { "n", "r", "<cmd>DiffviewRefresh<cr>", { desc = "刷新 Git 状态" } },
        },
      },
    })
  end,
}
