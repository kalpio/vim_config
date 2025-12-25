return {
  -- Flexoki
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    priority = 1000,
  },
  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  -- Tokyo Night
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  -- Kanagawa
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  -- Set active theme here
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "flexoki-light",
      -- Other options:
      -- "flexoki-dark"
      -- "catppuccin-latte" (light), "catppuccin-mocha" (dark)
      -- "tokyonight-day" (light), "tokyonight-night" (dark)
      -- "gruvbox" (set vim.o.background = "light" or "dark")
      -- "rose-pine-dawn" (light), "rose-pine-moon" (dark)
      -- "kanagawa-lotus" (light), "kanagawa-wave" (dark)
    },
  },
}
