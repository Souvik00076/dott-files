return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "ravitemer/mcphub.nvim",
  },
  opts = {
    display = {
      chat = {
        window = {
          layout = "vertical", -- float|vertical|horizontal|buffer
          position = "right", -- left|right|top|bottom
          border = "rounded", -- single|double|rounded|solid|shadow|none
          width = 0.4, -- percentage (0.0-1.0) or absolute number
          height = 1.0,
          relative = "editor", -- editor|cursor|win
          full_height = true, -- when false, uses vsplit instead of botright/topleft vsplit
          sticky = false,
          opts = {
            breakindent = true, -- indent wrapped lines
            cursorcolumn = false, -- highlight cursor column
            cursorline = false, -- highlight cursor line
            foldcolumn = "0", -- width of fold column
            linebreak = true, -- break lines at word boundaries
            list = false, -- show invisible characters
            numberwidth = 1, -- width of number column
            signcolumn = "no", -- show sign column (yes|no|auto)
            spell = false, -- spell checking
            wrap = true, -- wrap long lines
            number = false, -- show line numbers
            relativenumber = false, -- show relative line numbers
          },
        },
        icons = {
          buffer_pin = "📌 ", -- icon for pinned buffers
          buffer_watch = "👀 ", -- icon for watched buffers
          chat_context = "📎 ", -- icon for context fold
          chat_fold = " ", -- icon for reasoning fold
        },
        -- UI behavior
        auto_scroll = true, -- auto-scroll as response streams
        fold_context = true, -- fold context items to save space
        fold_reasoning = true, -- fold reasoning output after streaming
        show_reasoning = true, -- show reasoning output at all
        show_context = true, -- show context from variables/slash commands
        show_header_separator = false, -- show separators between headers
        show_settings = false, -- show LLM settings at top
        show_token_count = true, -- show token count for each response
        show_tools_processing = true, -- show loading when tools execute
        start_in_insert_mode = false, -- start in insert mode when opening
        separator = "─", -- separator between messages
        intro_message = "Welcome to CodeCompanion ✨! Press ? for options",

        -- Token count display customization
        token_count = function(tokens, adapter)
          return " (" .. tokens .. " tokens)"
        end,

        -- Debug window sizing
        debug_window = {
          width = vim.o.columns - 5,
          height = vim.o.lines - 2,
        },
        diff_window = {
          width = function()
            return math.min(120, vim.o.columns - 10)
          end,
          height = function()
            return vim.o.lines - 4
          end,
          opts = {
            number = true,
            relativenumber = false,
          },
        },
        child_window = {
          width = vim.o.columns - 5,
          height = vim.o.lines - 2,
          row = "center",
          col = "center",
          relative = "editor",
          opts = {
            wrap = false,
            number = false,
            relativenumber = false,
          },
        },
        -- User and LLM role names
        roles = {
          llm = function(adapter)
            return "CodeCompanion (" .. adapter.formatted_name .. ")"
          end,
          user = "Me",
        },
      },
    },
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      },
    },
    adapters = {
      http = {
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
  keys = {
    { "<leader>cp", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
  },
}
