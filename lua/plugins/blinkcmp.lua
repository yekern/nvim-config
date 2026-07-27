return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<Esc>"] = { "hide", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 150,
        },
        menu = {
          border = "rounded",
          winblend = 0,
          draw = {
            columns = {
              { "kind_icon", "label", "label_description", gap = 1 },
              { "source_name", gap = 1 },
            },
            treesitter = { enabled = true },
          },
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          lsp = { score_offset = 100 },
          path = { score_offset = 80 },
          snippets = { score_offset = 70 },
          buffer = { score_offset = 40 },
        },
      },

      -- ✅ 干净写法，不再报 Unexpected field
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },

      signature = {
        enabled = true,
        window = { show_documentation = false },
      },
    },
  },
}
