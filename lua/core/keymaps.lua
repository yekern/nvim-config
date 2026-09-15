local map = vim.keymap.set

-- ── 搜索高亮 ────────────────────────────────────
map("n", "<leader>n", "<cmd>nohlsearch<cr>", { desc = "取消搜索高亮" })

-- ── 窗口跳转（Ctrl + h/j/k/l，不用按空格）────────
map("n", "<C-h>", "<C-w>h", { desc = "跳到左侧窗口" })
map("n", "<C-j>", "<C-w>j", { desc = "跳到下方窗口" })
map("n", "<C-k>", "<C-w>k", { desc = "跳到上方窗口" })
map("n", "<C-l>", "<C-w>l", { desc = "跳到右侧窗口" })

-- ── 分屏（h/j/k/l 表示新窗口出现的方向）─────────
map("n", "<leader>wh", "<cmd>aboveleft vsplit<cr>", { desc = "向左分屏" })
map("n", "<leader>wl", "<cmd>belowright vsplit<cr>", { desc = "向右分屏" })
map("n", "<leader>wk", "<cmd>aboveleft split<cr>", { desc = "向上分屏" })
map("n", "<leader>wj", "<cmd>belowright split<cr>", { desc = "向下分屏" })
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "关闭当前窗口" })
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "只保留当前窗口" })

-- ── 快捷键速查 ──────────────────────────────────
map("n", "<leader>?", function()
  require("which-key").show("<leader>")
end, { desc = "显示全部快捷键" })
