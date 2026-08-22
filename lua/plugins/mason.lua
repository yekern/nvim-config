return {
  -- ── Mason ───────────────────────────────────────
  {
    "mason-org/mason.nvim",
    opts = {},
    config = function()
      require("mason").setup()
    end,
  },

  -- ── Mason-LSPConfig ─────────────────────────────
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "phpactor","ts_ls","vue_ls" },
      automatic_enable = false,
    },
    dependencies = { "mason-org/mason.nvim" },
  },

  -- ── LSP 配置（0.11 原生 API）────────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local on_attach = function(_, bufnr)
        local map = vim.keymap.set
        local o = { buffer = bufnr, silent = true }

        -- LSP 跳转（<leader>l 前缀，全小写）
        map("n", "<leader>ld", vim.lsp.buf.definition, o)
        map("n", "<leader>lr", vim.lsp.buf.references, o)
        map("n", "<leader>li", vim.lsp.buf.implementation, o)
        map("n", "<leader>lh", vim.lsp.buf.hover, o)
        map("n", "<leader>ln", vim.lsp.buf.rename, o)
        map("n", "<leader>la", vim.lsp.buf.code_action, o)
        map("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, o)
        map("n", "<leader>lj", vim.diagnostic.goto_next, o)
        map("n", "<leader>lk", vim.diagnostic.goto_prev, o)
        map("n", "K", vim.lsp.buf.hover, o)
      end

      -- PHP：Phpactor
      vim.lsp.config("phpactor", {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_markers = { "composer.json", ".git" },
        on_attach = on_attach,
      })
      vim.lsp.enable("phpactor")

      -- Lua：Neovim 配置自身
      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- TypeScript / Vue
      -- local mason_pkgs = vim.fn.stdpath("data") .. "/mason/packages"
      -- local vue_plugin = mason_pkgs
      --   .. "/vue-language-server/node_modules/@vue/language-server"
      --
      -- vim.lsp.config("ts_ls", {
      --   on_attach = on_attach,
      --   init_options = {
      --     plugins = {
      --       {
      --         name = "@vue/typescript-plugin",
      --         location = vue_plugin,
      --         languages = { "vue" },
      --       },
      --     },
      --   },
      --   filetypes = {
      --     "typescript",
      --     "javascript",
      --     "javascriptreact",
      --     "typescriptreact",
      --     "vue",
      --   },
      -- })
      -- vim.lsp.enable("ts_ls")
      --
      -- -- Vue Language Server
      -- vim.lsp.config("vue_ls", {
      --   on_attach = on_attach,
      --   init_options = {
      --     typescript = {
      --       tsdk = mason_pkgs .. "/vue-language-server/node_modules/typescript/lib",
      --     },
      --   },
      -- })
      -- vim.lsp.enable("vue_ls")

    end,
  },
}
