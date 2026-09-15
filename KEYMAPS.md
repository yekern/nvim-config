# Neovim 快捷键手册

> 2026-09-15 整理。改键位时请同步更新这里。

## 0. 记不住怎么办（三条路，任选）

1. **按 `空格` 停 0.3 秒** → which-key 自动列出「下一步能按什么、是什么功能」。
2. **`空格 ?`** → 把全部以空格开头的快捷键铺开显示（Esc 退出）。
3. **`空格 h k`** → 用 Telescope 模糊搜索**所有**快捷键（连原生键也能搜），例：输 `git` 就能看到所有 Git 相关键。

记忆规则只有一条：**单键 = 高频动作；组（b/g/h/j/l/m/w）= 同一主题下的一批键。**

## 1. 高频动作：`空格` + 一个键

| 键 | 功能 |
| --- | --- |
| `空格 e` | 文件树 开/关（`e` = explorer） |
| `空格 E` | 在文件树里定位当前文件（焦点会落到树里） |
| `空格 f` | 查找文件 |
| `空格 /` | 全局搜索文件内容（`/` = 搜索） |
| `空格 s` | 当前文件的函数/符号列表（`s` = symbol） |
| `空格 r` | 最近打开的文件（`r` = recent） |
| `空格 o` | 代码大纲侧栏 开/关（`o` = outline） |
| `空格 c` | 注释/取消注释当前行；可视模式下注释选中内容 |
| `空格 n` | 取消搜索高亮 |
| `空格 ?` | 显示全部快捷键 |

## 2. 分组快捷键

### `空格 b` — Buffer 缓冲区

| 键 | 功能 |
| --- | --- |
| `空格 b b` | 切换 Buffer（打开列表搜索） |
| `空格 b c` | 关闭当前 Buffer（在文件树里按则切回编辑区） |
| `空格 b l` | 关闭左侧所有 Buffer |
| `空格 b r` | 关闭右侧所有 Buffer |
| `空格 b o` | 关闭其他所有 Buffer |

### `空格 g` — Git

| 键 | 功能 |
| --- | --- |
| `空格 g g` | Lazygit（提交/推送/分支/暂存，全功能 Git 界面） |
| `空格 g d` | Diffview 改动审查界面 开/关（在编辑器里看全项目 diff） |
| `空格 g s` | 暂存当前改动块（可视模式：暂存选中行） |
| `空格 g r` | 撤销当前改动块（可视模式：撤销选中行） |
| `空格 g u` | 取消暂存（undo stage） |
| `空格 g p` | 预览当前改动块（浮窗） |
| `空格 g b` | 当前行 blame 开关 |
| `空格 g f` | 本文件 diff（对着暂存区 / HEAD） |
| `空格 g S` | 暂存整个文件 |
| `空格 g R` | 撤销整个文件的改动 |

### `空格 h` — 帮助

| 键 | 功能 |
| --- | --- |
| `空格 h k` | 快捷键速查（搜全部键位） |
| `空格 h h` | Neovim 帮助文档 |

### `空格 j` — Jump 跳转（hop）

| 键 | 功能 |
| --- | --- |
| `空格 j w` | 跳到某个单词：屏幕出现字母提示，按提示字母即可跳 |
| `空格 j c` | 跳到任意两个字符处 |
| `空格 j l` | 跳到某一行 |

### `空格 l` — LSP 代码智能（只在支持语言服务的文件里出现）

| 键 | 功能 |
| --- | --- |
| `空格 l d` | 跳到定义 |
| `空格 l r` | 查找所有引用（结果进 quickfix） |
| `空格 l i` | 跳到实现 |
| `空格 l h` | 悬浮文档（等同 `K`） |
| `空格 l n` | 重命名符号（全项目一起改） |
| `空格 l a` | 代码动作 / 快速修复 |
| `空格 l f` | 格式化当前文件 |
| `空格 l j` | 下一个诊断（错误/警告） |
| `空格 l k` | 上一个诊断 |
| `空格 l e` | 诊断列表（Telescope） |

### `空格 m` — Markdown

| 键 | 功能 |
| --- | --- |
| `空格 m r` | 渲染效果 开/关（把 Markdown 显示成排版后的样子） |
| `空格 m p` | 用 glow 预览 Markdown |

### `空格 w` — Window 窗口

| 键 | 功能 |
| --- | --- |
| `空格 w h` | 向左分屏 |
| `空格 w l` | 向右分屏 |
| `空格 w k` | 向上分屏 |
| `空格 w j` | 向下分屏 |
| `空格 w d` | 关闭当前窗口 |
| `空格 w o` | 只保留当前窗口 |

## 3. 不带空格的键

| 键 | 功能 |
| --- | --- |
| `Ctrl h / j / k / l` | 在窗口间跳（左/下/上/右），比原生 `Ctrl w` 少按一个键 |
| `Tab` / `Shift Tab` | 下一个 / 上一个 Buffer |
| `]c` / `[c` | 跳到下一个 / 上一个改动块 |
| `K` | 悬浮文档（LSP） |
| `Esc` | 退插入模式 / 关浮窗 |

## 4. 插件自带的老牌键（不用背，用得多自然会）

| 键 | 效果 | 来自 |
| --- | --- | --- |
| `gcc` / `gc` | 注释当前行 / 注释选中内容（`空格 c` 是同一个功能的短键） | Comment.nvim |
| `ys{motion}{配对符}` | 加环绕：`ysiw"` 给单词套双引号 | nvim-surround |
| `cs{旧}{新}` | 换环绕：`cs"'` 双引号换单引号 | nvim-surround |
| `ds{配对符}` | 删环绕：`ds"` | nvim-surround |
| `zc` / `zo` / `za` | 折叠 / 展开 / 切换折叠 | Neovim（treesitter） |
| `zR` / `zM` | 展开全部 / 折叠全部 | Neovim（treesitter） |
| `gd` | 原生「跳定义」（`空格 l d` 更好用，会走 LSP） | Neovim 内置 |

## 5. 典型流程（照着按就行）

- **找文件**：`空格 f` → 输几个字符 → `回车` 打开（`Esc` 取消）
- **搜代码**：`空格 /` → 输关键字 → `回车`
- **跳函数**：光标停在函数名上 → `空格 l d`
- **看谁调用了它**：`空格 l r`
- **改完看改动**：`空格 g d`（全项目 diff，可读可改）→ 再按一次关闭
- **格式化当前文件**：`空格 l f`（PHP 用项目的 Pint、Vue/TS 用 Prettier、Go 用 gofmt）
- **提交**：`空格 g g` → 在 lazygit 里 `空格` 暂存、`c` 提交、`P` 推送、`q` 退出
- **只暂存一部分**：光标停在改动上 → `空格 g s`（按块暂存），`空格 g r` 撤销
- **在文件里乱跑**：`空格 j w` 跟着字母提示跳
- **卡住了**：`空格 h k` 搜键位；`:q` 退出、`:w` 保存

## 6. 插件清单（装了什么、干什么）

| 插件 | 作用 | 相关键 |
| --- | --- | --- |
| nvim-tree | 左侧文件树 | `空格 e` `空格 E` |
| telescope (+fzf-native) | 模糊查找一切 | `空格 f` `空格 /` `空格 s` `空格 r` `空格 b b` `空格 l e` `空格 h k` `空格 h h` |
| bufferline | 顶部 Buffer 标签栏 | `Tab` `Shift Tab` `空格 b *` |
| which-key | 按键提示面板（把记忆外包给它） | `空格` `空格 ?` |
| nvim-lspconfig + mason | LSP 语言服务：PHP = phpactor + laravel-ls、Go = gopls、TS/JS/Vue = vtsls + vue_ls、Lua = lua_ls | `空格 l *` `K` |
| conform.nvim | 格式化：PHP 用项目的 Pint、前端用 Prettier、Go 用 gofmt，没有就回退 LSP | `空格 l f` |
| blink.cmp | 补全：`Tab` 选择、`回车` 确认、`Esc` 关闭 | 插入模式 |
| nvim-treesitter | 语法高亮 + 折叠（main 分支重写版） | 自动，折叠用 `z*` |
| gitsigns | 行内增删改标记、按块暂存/撤销、blame | `空格 g s/r/u/p/b/f/S/R` `]c` `[c` |
| diffview | 在编辑器里读全项目 diff | `空格 g d` |
| lazygit | 终端 Git UI（提交/推送/分支） | `空格 g g` |
| hop | 屏幕内快速跳转 | `空格 j *` |
| aerial | 代码大纲侧栏 | `空格 o` |
| Comment.nvim | 注释 | `空格 c` `gcc` `gc` |
| nvim-surround | 成对符号增删改 | `ys` `cs` `ds` |
| nvim-autopairs | 括号自动配对 | 插入模式 |
| render-markdown | Markdown 原地排版渲染 | `空格 m r` |
| glow | 预览 Markdown | `空格 m p` |
| lualine | 底部状态栏（分支、diff 统计） | — |
| catppuccin | 主题（macchiato，透明背景） | — |

## 7. lazygit 和 diffview 会不会重复？

不重复，分工不同：

- **lazygit**＝做 Git **操作**：暂存、提交、推送、拉取、切分支、rebase、stash。它是独立 TUI，看代码没有语法高亮、不能直接改。
- **diffview**＝在**编辑器里读** diff：左右对比、有语法高亮、能直接跳进真实文件改，还能 `:DiffviewFileHistory %` 看单文件历史。审查 AI 改的代码时它比 lazygit 好用。
- **gitsigns**＝行级微操：光标所在改动块的暂存/撤销/预览/blame。

如果只想留一个：删掉 `lua/plugins/diffview.lua`、并去掉 `lua/plugins/gitsigns.lua` 里不需要的键即可，其余不受影响。

## 8. 本次整理修复的问题

1. `空格 e` 被定义了两次（`NvimTreeToggle` 和 `NvimTreeFocus`），后定义的覆盖前者 → 统一为「开/关」。
2. `<leader>bl` 重复定义两遍（复制粘贴残留）→ 清理，补上 `空格 b o`（关闭其他）。
3. `空格 w k` 的命令拼成了 `<cmdsplit`（会报错）→ 重写为 `aboveleft split`；分屏不再改动 `splitright/splitbelow` 全局选项。
4. which-key 里声明了 `空格 c` / `空格 h` / `空格 t` 三个分组却没有任何键位（弹窗是空的）→ 现在每个分组都有真实键位：`c` 变成单键、`h` 是帮助组、`t` 删除。
5. **LSP 键位原来挂在 `on_attach` 上，Neovim 0.11+ 已不生效**（实测 `空格 l d` 按下去毫无反应）→ 改挂 `LspAttach` 自动命令；现在键位只在支持的语言文件里出现且确实生效（已验证跳转、引用）。
6. gitsigns 装了但没配置、没键位；hop 装了没有任何键位 → 都接上了（见上表）。
7. nvim-treesitter 已升级到 main 分支（重写版），旧的 `highlight/indent/incremental_selection` 配置全部失效、**语法高亮实际没走 treesitter** → 改为显式 `vim.treesitter.start()` + treesitter 折叠，并自动补装缺失 parser（已补 lua/python/css/json/markdown/go/blade/yaml/bash/tsx 等）。
8. `lua/plugins-config/nvim-tree.lua` 是没被引用的死文件（且语法有错）→ 删除。
9. lazy.nvim 安装路径少了一个 `/`（装在 `~/.local/share/nvimlazy`）→ 修正路径并搬回标准位置 `~/.local/share/nvim/lazy`。
10. nvim-autopairs 的配置字段拼成 `optos`（等于没配置）→ 修正为 `opts`。
11. bufferline 里判断文件树用的 filetype 是 `nvimtree`，而实际是 `NvimTree`（大小写不符）→ 统一为大小写无关比较；`空格 b c` 在树里按也会正确回到编辑区（原来还往错误方向 `wincmd h`）。
12. 文件命名与实际内容不符：`tokyonight.lua`（其实是 catppuccin）→ `colorscheme.lua`；`glow.lua`（含 render-markdown）→ `markdown.lua`；`mason.lua`（含全部 LSP 配置）→ `lsp.lua`。
13. 启动时对所有文件强设 `foldmethod=expr` → 现在只对能解析出语法树的文件类型设置。
14. 新增 `updatetime = 250`，让 gitsigns 标记和诊断更新更及时。

## 9. 按项目补装的语言服务（2026-09-15 第二批）

按 `~/Code` 下实际代码量补的，改 `.uvue/.uts` 时也能用了：

| 项目类型 | 代码量 | 现在用什么 |
| --- | --- | --- |
| Laravel（fubao-life / laravel-kefu） | 2160 个 php | `phpactor`（通用 PHP）+ `laravel_ls`（Laravel 专属：route/config/view/env/模型字段，blade 文件也有） |
| Go（go-full-framework / kefu-go） | 768 个 go | `gopls`（用 `~/go/bin/gopls`，含 staticcheck 分析与参数名提示） |
| 前端（Vue/TS/JS） | 766 个 ts + 708 个 vue | `vtsls`（TS/JS）+ `vue_ls`（Vue SFC），vtsls 已挂 `@vue/typescript-plugin`，两者必须一起开（vue_ls 3.x 是 hybrid 模式） |
| uni-app x（.uvue/.uts） | 42 个 | 以前**没有任何高亮和补全**（nvim 不认这两个后缀）→ 现在映射为 vue/typescript，高亮 + LSP 都有了 |

### PHP 三个服务怎么分工（2026-09-15 追加，实测对比后定的）

| 服务 | 负责 | 实测依据 |
| --- | --- | --- |
| **Intelephense**（主力） | 补全、hover、跳定义、找引用、诊断 | `Cache::` 处补全 **100 项 / 8ms**（phpactor 只有 13 项）；`$model::query()` 能找到 **2745 条**引用（phpactor 只找到 8 条，因为它认不出 Laravel 基类继承来的方法） |
| **Phpactor** | **重命名**、代码动作、找实现 | 这三项是 intelephense 的**付费**功能（$35 一次性授权）；phpactor 免费，实测重命名 `AdSlot` 类名 = 8 个文件 30 处编辑 |
| **laravel-ls** | Laravel 专属：`config('app.url')` 能**直接跳到 config/app.php**，`route()`/`view()`/`__()` 同理；blade 文件也归它 | 另两个服务在这个位置都是空结果 |

三者的能力已在 `lua/plugins/lsp.lua` 的 `on_init` 里切成互不重叠，**不会出现重复补全或重复诊断**。

- 重命名时输入框会**预填旧名字**，先按 `Ctrl-U` 清空再输新名（Neovim 通用行为，不是配置问题）。
- 输入框回车后改动会落在缓冲区里，**记得 `:w`** 保存；想放弃就 `:e!` 重载。
- 内存占用（单项目实测）：intelephense ≈ 360MB、phpactor ≈ 130MB、laravel-ls ≈ 17MB。不做重命名/代码动作的话，注释掉 `vim.lsp.enable("phpactor")` 可省 130MB。
- 想「一个服务搞定」：买 intelephense 授权（$35，终身）→ 把 `licenceKey` 填上、删掉 intelephense `on_init` 里那三行、再停用 phpactor。

格式化（`空格 l f`）按项目里的工具走，不额外装全局包：

| 文件 | 用谁 |
| --- | --- |
| php | 项目自带的 Pint（`vendor/bin/pint`，读你的 `pint.json`） |
| vue / ts / js / css / scss / html / json / yaml / md | 项目自带的 Prettier（`node_modules/.bin/prettier`） |
| go | gofmt |
| 其他（lua 等） | 回退到 LSP 的格式化 |

另外补了 sql / scss / dockerfile / ini / make 的 treesitter 语法树。

> 注意：nvim 必须从终端（iTerm/kaku）启动，`vtsls`/`vue_ls` 需要 PATH 里有 node（volta 的 `~/.volta/bin`）。从 GUI 启动器打开的话，请先把 PATH 配好。

## 10. 可选补充（还没装，需要时再说）

| 插件 | 能解决什么 | 成本 |
| --- | --- | --- |
| `nvim-dap` + `nvim-dap-ui` | 图形断点调试。Go 侧 `dlv` 你已经装了，接上就能用；PHP 要配 Xdebug | 中 |
| `neotest` | 在编辑器里跑 PHPUnit / Go test，红绿标记 | 中 |
| `nvim-spectre` | 全项目搜索替换（带预览），适合批量改路由名/权限码 | 低 |
| `fidget.nvim` | 右下角显示 LSP 索引进度（phpactor/gopls 首次索引很慢） | 低 |
| `inc-rename.nvim` | 重命名时实时预览改动（配合 `空格 l n`，但不会改到就别处） | 低 |

目前这些没装的理由：都能用现成手段替代（`空格 l e` 看诊断、lazygit 看 diff、AI 会话里做批量替换），装了会多一层要维护的配置。

## 11. 其他说明

- TS/Vue 语言服务已启用（第二批），原来的 `ts_ls` 注释配置已被 `vtsls + vue_ls` 取代。
- 格式化不在保存时自动跑（避免 AI 写的大改动被整片重排）；要开自动格式化，在 `lua/plugins/format.lua` 的 `opts` 里加 `format_on_save = { timeout_ms = 1000 }`。
- 主题固定为 catppuccin macchiato（原 `空格 t h` 循环主题的键随 tokyonight 一起删了）；要换风格改 `lua/plugins/colorscheme.lua` 的 `flavour`（latte / frappe / macchiato / mocha）。
- 窗口/分屏、Buffer 的键位都在上面表里，`.vimrc` 时代的 `Ctrl w` 前缀键仍然可用（原生），只是推荐用 `Ctrl h/j/k/l`。
