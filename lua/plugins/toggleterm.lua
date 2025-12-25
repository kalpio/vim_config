return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-`>]],
    direction = "horizontal",
    size = 15,
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return "Terminal #" .. term.id
      end,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    local function switch_term(id)
      local terms = require("toggleterm.terminal").get_all()
      for _, term in ipairs(terms) do
        if term:is_open() then
          term:close()
        end
      end
      require("toggleterm").toggle(id)
    end

    for i = 1, 9 do
      vim.keymap.set({ "n", "t" }, "<C-" .. i .. ">", function()
        switch_term(i)
      end, { desc = "Terminal " .. i })
    end
  end,
  keys = {
    { "<C-`>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal", mode = { "n", "t" } },
    { "<leader>ts", "<cmd>TermSelect<CR>", desc = "Select terminal" },
    { "<leader>tn", "<cmd>ToggleTermSetName<CR>", desc = "Name terminal" },
    { "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", desc = "Toggle all terminals" },
  },
}
