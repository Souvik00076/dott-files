return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- creating & opening
    { "<leader>on", "<cmd>Obsidian new<CR>", desc = "New note" },
    { "<leader>oo", "<cmd>Obsidian open<CR>", desc = "Open in Obsidian app" },
    { "<leader>oq", "<cmd>Obsidian quick_switch<CR>", desc = "Quick switch note" },

    -- searching & finding
    { "<leader>os", "<cmd>Obsidian search<CR>", desc = "Search notes" },
    { "<leader>ot", "<cmd>Obsidian tags<CR>", desc = "Search by tag" },
    { "<leader>ob", "<cmd>Obsidian back_links<CR>", desc = "Show backlinks" },

    -- linking
    { "<leader>ol", "<cmd>Obsidian link<CR>", mode = "v", desc = "Link selection" },
    { "<leader>oL", "<cmd>Obsidian link_new<CR>", mode = "v", desc = "Link selection to new note" },

    -- daily notes
    { "<leader>od", "<cmd>Obsidian today<CR>", desc = "Today's daily note" },
    { "<leader>oy", "<cmd>Obsidian yesterday<CR>", desc = "Yesterday's note" },
    { "<leader>oT", "<cmd>Obsidian tomorrow<CR>", desc = "Tomorrow's note" },

    -- utils
    { "<leader>or", "<cmd>Obsidian rename<CR>", desc = "Rename note (updates backlinks)" },
    { "<leader>oc", "<cmd>Obsidian toc<CR>", desc = "Table of contents" },
    { "<leader>ow", "<cmd>Obsidian workspace<CR>", desc = "Switch workspace" },
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "study",
        path = "~/personal/Computer-Science/",
      },
      {
        name = "clients",
        path = "~/personal/Client-Projects/",
      },
      {
        name = "todos",
        path = "~/personal/Daily-Notes/",
      },
    },
  },
}
