local opt = vim.opt

vim.g.mapleader = " "

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进

opt.tabstop = 2
opt.shiftwidth = 0
opt.expandtab = true
opt.autoindent = true
opt.autoread = true
-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪切板
-- opt.clipboard:append("unnamedplus")
vim.g.clipboard = "osc52"
opt.clipboard = "unnamedplus"

-- 默认新窗口右边和下面
opt.splitright = true
opt.splitbelow = true

-- 搜索不区分大小写
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"


-- vim.g.clipboard = {
--   name = "OSC52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste,  -- ← 不传参
--     ["*"] = require("vim.ui.clipboard.osc52").paste,  -- ← 不传参
--   },
-- }
