local keymap = vim.keymap

-- 窗口管理
-- 用 <leader>（通常是空格）加上方向来快速创建分屏
keymap.set("n", "<leader>wh", "<cmd>set nosplitright<cr><cmd>vsplit<cr>", { desc = "向左分屏" })
keymap.set("n", "<leader>wl", "<cmd>set splitright<cr><cmd>vsplit<cr>", { desc = "向右分屏" })
keymap.set("n", "<leader>wj", "<cmd>set splitbelow<cr><cmd>split<cr>", { desc = "向下分屏" })
keymap.set("n", "<leader>wk", "<cmd>set nosplitbelow<cr><cmdsplit<cr>", { desc = "向上分屏" })

-- 💥 核心：一键关闭当前分屏
keymap.set("n", "<leader>wd", "<cmd>close<cr>", { desc = "关闭当前分屏" })
-- 一键关闭其他所有分屏（独占当前窗口）
keymap.set("n", "<leader>wo", "<cmd>only<cr>", { desc = "关闭其他所有分屏" })

-- 取消高亮
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "取消高亮" })

