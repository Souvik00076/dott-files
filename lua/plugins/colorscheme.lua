-- return {
--   {
--     "craftzdog/solarized-osaka.nvim",
--     lazy = true,
--     priority = 1000,
--     opts = function()
--       return {
--         transparent = true,
--       }
--     end,
--   },
-- }
--
-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }

--return { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }
return {
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oxocarbon",
    },
  },
}
