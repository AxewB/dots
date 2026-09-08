vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",

    version = "v1.8.0",
  },

  -- optional deps
  -- { src = 'https://github.com/rafamadriz/friendly-snippets' }, -- snippets
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/onsails/lspkind.nvim" },
})

require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<Tab>"] = {

      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<C-l>"] = { "select_and_accept", "fallback" },
    -- in case of accepting with caps_word ON in ZMK
    ["<C-L>"] = { "select_and_accept", "fallback" },

    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
  },
  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true,
  },
  completion = {
    trigger = {
      show_on_insert_on_trigger_character = true,
      show_on_trigger_character = true,

      show_on_accept_on_trigger_character = true,
      show_on_x_blocked_trigger_characters = { "'", '"', "(", "{", "[" },
    },
    documentation = {
      window = { border = "none" },
      auto_show = true,
      auto_show_delay_ms = 500,
    },
    ghost_text = {
      enabled = false,
      show_with_menu = true,
    },
    menu = {
      border = "none",
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        components = {
          kind_icon = {
            text = function(ctx)
              if ctx.source_name ~= "Path" then
                return require("lspkind").symbol_map[ctx.kind]
                  or "" .. ctx.icon_gap
              end

              local is_unknown_type = vim.tbl_contains(
                { "link", "socket", "fifo", "char", "block", "unknown" },
                ctx.item.data.type
              )
              local mini_icon, _ = require("mini.icons").get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )

              return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
            end,

            highlight = function(ctx)
              if ctx.source_name ~= "Path" then
                return ctx.kind_hl
              end

              local is_unknown_type = vim.tbl_contains(
                { "link", "socket", "fifo", "char", "block", "unknown" },
                ctx.item.data.type
              )
              local mini_icon, mini_hl = require("mini.icons").get(
                is_unknown_type and "os" or ctx.item.data.type,
                is_unknown_type and "" or ctx.label
              )
              return mini_icon ~= nil and mini_hl or ctx.kind_hl
            end,
          },
        },
      },
    },
  },
  signature = {
    enabled = false,
    window = { border = "none" },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  -- snippets = {
  --   preset = "luasnip",
  -- },
  fuzzy = {
    implementation = "prefer_rust_with_warning",

    prebuilt_binaries = {
      force_version = "v1.8.0",

      proxy = {
        from_env = false,
      },
    },

    sorts = {
      "score",
      "sort_text",
      "label",
    },
  },
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

-- LUASNIP snippets

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node

ls.add_snippets("all", {
  s("date", {
    f(function()
      return vim.fn.strftime("%Y-%m-%d")
    end, {}),
  }, { desc = "Date YYYY-MM-DD" }),
})

ls.add_snippets("all", {
  s("datetime", {
    f(function()
      return vim.fn.strftime("%Y-%m-%d_%H-%M-%S")
    end, {}),
  }, { desc = "Datetime YYYY-MM-DD_HH-MM-SS" }),
})

ls.add_snippets("all", {
  s("time", {
    f(function()
      return vim.fn.strftime("%H-%M-%S")
    end, {}),
  }, { desc = "Time HH-MM-SS" }),
})
