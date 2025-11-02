return {
  "olimorris/codecompanion.nvim",

  dependencies = {
    "ravitemer/mcphub.nvim",
    "j-hui/fidget.nvim",
  },
  config = function()
    require("codecompanion").setup({})

    local ns_id = vim.api.nvim_create_namespace("codecompanion_progress")
    local extmark_id = nil
    local current_bufnr = nil

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "CodeCompanionRequest*",
      callback = function(request)
        if request.match == "CodeCompanionRequestStarted" then
          current_bufnr = vim.api.nvim_get_current_buf()
          if vim.bo[current_bufnr].filetype == "codecompanion" then
            local line_count = vim.api.nvim_buf_line_count(current_bufnr)

            extmark_id = vim.api.nvim_buf_set_extmark(current_bufnr, ns_id, line_count - 1, 0, {
              virt_text = { { "⏳ ", "Comment" } },
            })
          end
        elseif request.match == "CodeCompanionRequestFinished" then
          if current_bufnr and extmark_id then
            vim.api.nvim_buf_del_extmark(current_bufnr, ns_id, extmark_id)
            extmark_id = nil
            current_bufnr = nil
          end
        end
      end,
    })
  end,
  opts = {

    display = {

      diff = {
        enabled = true,
      },

      chat = {

        window = {
          border = "rounded",
          width = 0.5,
          height = 0.8,
          style = "minimal",
        },

        diff_window = {
          width = function()
            return math.floor(vim.o.columns * 0.8)
          end,
          height = function()
            return math.floor(vim.o.lines * 0.7)
          end,
          col = function()
            local width = math.floor(vim.o.columns * 0.8)
            return math.floor((vim.o.columns - width) / 2)
          end,
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

    strategies = {
      chat = {
        adapter = "gemini",
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
    { "<leader>ci", "<cmd>CodeCompanion<cr>", mode = { "n", "v" }, desc = "CodeCompanion Inline" },
    { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle Chat" },
    { "<leader>cac", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "<leader>cm", "<cmd>CodeCompanionChat model<cr>", mode = { "n", "v" }, desc = "Change Model" },
  },
}
