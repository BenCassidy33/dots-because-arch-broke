local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,select",
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["C-p"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.scroll_docs(4),
    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<C-f>"] = cmp.mapping.complete({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --["<leader>ca"] = cmp.mapping.code_action(),
  }),

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "calc" },
  }),

  window = {
    documentation = {
      --border = "rounded",
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 50,
      min_width = 50,
      max_height = math.floor(vim.o.lines * 0.4),
      min_height = 3,
    },
  },
})
