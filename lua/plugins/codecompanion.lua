-- Configuration for the CodeCompanion Neovim plugin.

-- Main plugin configuration

return {
  "olimorris/codecompanion.nvim",
  -- Plugin dependencies

  dependencies = {
    "ravitemer/mcphub.nvim",
  },
  -- Plugin options

  opts = {
    -- Display related settings

    display = {
      -- Diff display settings

      diff = {
        enabled = true,
      },
      -- Chat display settings

      chat = {
        show_settings = true,
        -- Chat window layout

        window = {
          layout = "float", -- Make chat window float too
          border = "rounded",
          width = 0.8,
          height = 0.8,
          style = "minimal",
        },
        -- Diff window layout

        diff_window = {
          layout = "float", -- Floating window
          border = "rounded", -- Nice rounded borders
          -- 80% width, centered
          width = function()
            return math.floor(vim.o.columns * 0.8)
          end,
          -- 70% height, centered
          height = function()
            return math.floor(vim.o.lines * 0.7)
          end,
          -- Center the window horizontally
          col = function()
            local width = math.floor(vim.o.columns * 0.8)
            return math.floor((vim.o.columns - width) / 2)
          end,
          -- Center the window vertically
          row = function()
            local height = math.floor(vim.o.lines * 0.7)
            return math.floor((vim.o.lines - height) / 2)
          end,
          opts = {
            number = true,
            relativenumber = false,
            cursorline = true,
            wrap = false,
            signcolumn = "yes",
          },
        },
        intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
      },
    },
    -- AI strategy settings

    strategies = {
      -- Chat strategy using Gemini
      chat = {
        adapter = "gemini",
        variables = {
          ["buffer"] = {
            opts = {
              default_params = "pin", -- or 'watch'
            },
          },
        },
        tools = {

          editor = {
            enabled = true,
            opts = {
              diff = {
                enabled = true,
                close_chat_at = 240,
              },
              auto_submit = false,
              confirm = true,
              requires_approval = true,
            },
          },
          cmd_runner = {
            enabled = true,
          },
          files = {
            enabled = true,
          },
          rag = {
            enabled = true,
          },
        },
      },

      -- Inline strategy using Gemini

      inline = {
        adapter = "gemini",
      },
      -- Command strategy using Gemini

      cmd = {
        adapter = "gemini",
      },
    },
    -- Adapter configurations

    adapters = {
      http = {
        -- Gemini HTTP adapter

        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            env = {
              api_key = "GEMINI_API_KEY",
            },
          })
        end,
      },
    },
  },
  -- Keybindings
  config = function(_, opts)
    require("codecompanion").setup(opts)

    -- Set custom highlight groups for better visibility
    vim.api.nvim_set_hl(0, "CodeCompanionDiffBorder", {
      fg = "#00ffff", -- Bright cyan border
      bg = "#1a1b26",
      bold = true,
    })

    vim.api.nvim_set_hl(0, "CodeCompanionDiffBackground", {
      bg = "#1f2335", -- Slightly lighter than main background
    })
  end,
  keys = {
    { "<leader>cp", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "CodeCompanion Inline" },
    { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
    { "<leader>cac", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<leader>cm", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Change Model" },
  },
}
-- how comment works in lua
-- This is how a Lua comment works
