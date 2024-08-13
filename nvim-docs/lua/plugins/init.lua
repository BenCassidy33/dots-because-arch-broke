local M = {}

M.plugins = {
  {
    "folke/zen-mode.nvim",
    opts = {
    }
  },


  -- cmp
  {
    "https://github.com/hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      return require("plugins.cmp")
    end,

    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "https://github.com/uga-rosa/cmp-dictionary",
    event = "InsertEnter",
    config = function()
      require("cmp").setup({
        sources = {
          {
            name = "dictionary",
            keyword_length = 2,
          },
        }
      })

      require("cmp_dictionary").setup({
        paths = { "/usr/share/dict/words" },
        exact_length = 2,
      })
    end,

    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "https://github.com/nvim-telescope/telescope.nvim",
  },
  {
    "https://github.com/blazkowolf/gruber-darker.nvim",
    opts = {
      bold = true,
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
      undercurl = false,
      underline = true,
    },
  },
}

return M
