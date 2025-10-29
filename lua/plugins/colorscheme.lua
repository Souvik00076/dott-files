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

--End of solarized-osaka
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

-- End of gruvbox
--
-- return {
--   "scottmckendry/cyberdream.nvim",
--   lazy = false,
--   config = true,
--   priority = 1000,
--   opts = {
--     transparent = false,
--   },
-- }

-- End of cyber dream
-- return { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... }

-- return {
--   { "nyoom-engineering/oxocarbon.nvim" },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "oxocarbon",
--     },
--   },
-- }
--

--end of oxocarbon

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
  end,
}
--
-- return {
--   "rebelot/kanagawa.nvim",
--   name = "kanagawa",
--   config = function()
--     vim.cmd("colorscheme kanagawa-wave")
--   end,
-- }
