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

-- ── LSP 代码智能（全局定义，不要挂 LspAttach）────
-- 挂 LspAttach 时这些键只存在于「已附加语言服务」的 buffer。未附加时按键会漏成原生命令：
--   空格 l d  →  空格(右移) + l(右移) + d(删除操作符) → 再按一次 d 就是 dd，把当前行删掉
--   空格 l i  →  末尾的 i 直接进插入模式
-- 全局定义后，任何文件里按都有确定结果：要么执行，要么提示一句，不会变成别的命令。
local function lsp_map(lhs, fn, desc)
  map("n", lhs, function()
    if #vim.lsp.get_clients({ bufnr = 0 }) == 0 then
      vim.notify("当前文件没有 LSP 客户端，" .. lhs .. " 不可用", vim.log.levels.WARN)
      return
    end
    fn()
  end, { silent = true, desc = desc })
end

lsp_map("<leader>ld", vim.lsp.buf.definition, "跳到定义")
lsp_map("<leader>lr", vim.lsp.buf.references, "查找引用")
lsp_map("<leader>li", vim.lsp.buf.implementation, "跳到实现")
lsp_map("<leader>lh", vim.lsp.buf.hover, "悬浮文档")
lsp_map("<leader>ln", vim.lsp.buf.rename, "重命名符号")
lsp_map("<leader>la", vim.lsp.buf.code_action, "代码动作 / 快速修复")
lsp_map("K", vim.lsp.buf.hover, "悬浮文档")

-- 诊断跳转不依赖 LSP 客户端（诊断可以来自任何来源），所以不加 guard
map("n", "<leader>lj", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "下一个诊断" })
map("n", "<leader>lk", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "上一个诊断" })
-- 格式化 <leader>lf 在 conform.nvim 里（见 lua/plugins/format.lua）
