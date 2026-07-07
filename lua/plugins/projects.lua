-- Project switching: <leader>fp fuzzy-finds repo directories (nested up to
-- `max_depth` levels), cds into the selection, and opens the file finder there.
-- Repos live directly under $HOME; edit `project_dirs` if that changes
-- (e.g. { vim.fn.expand("~/projects") }).

local project_dirs = { vim.fn.expand("~") }
local max_depth = 4
-- directories never worth cd-ing into; pruned from the scan entirely
local ignore_dirs =
  { ".*", "node_modules", "dist", "build", "target", "__pycache__", "venv", "coverage", "vendor" }

local function list_projects()
  local prune = {}
  for i, name in ipairs(ignore_dirs) do
    if i > 1 then
      table.insert(prune, "-o")
    end
    vim.list_extend(prune, { "-name", name })
  end
  local dirs = {}
  for _, base in ipairs(project_dirs) do
    local cmd = { "find", base, "-mindepth", "1", "-maxdepth", tostring(max_depth), "(" }
    vim.list_extend(cmd, prune)
    vim.list_extend(cmd, { ")", "-prune", "-o", "-type", "d", "-print" })
    vim.list_extend(dirs, vim.fn.systemlist(cmd))
  end
  table.sort(dirs)
  return dirs
end

local function pick_project()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers
    .new({}, {
      prompt_title = "Switch Project",
      finder = finders.new_table({
        results = list_projects(),
        entry_maker = function(path)
          local name = vim.fn.fnamemodify(path, ":~")
          return { value = path, display = name, ordinal = name }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local entry = action_state.get_selected_entry()
          actions.close(prompt_bufnr)
          if not entry then
            return
          end
          vim.cmd.cd(vim.fn.fnameescape(entry.value))
          vim.notify("cwd: " .. entry.value, vim.log.levels.INFO)
          require("telescope.builtin").find_files({ cwd = entry.value })
        end)
        return true
      end,
    })
    :find()
end

return {
  -- the default snacks picker maps <leader>fp to "recent projects"; free it up
  {
    "folke/snacks.nvim",
    keys = { { "<leader>fp", false } },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>fp", pick_project, desc = "Switch Project (cd + find files)" },
    },
  },

  -- auto-cd to the detected project root whenever a file is opened
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    opts = {
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "package.json", "Cargo.toml", "go.mod", "pyproject.toml", "Makefile" },
      silent_chdir = true,
      scope_chdir = "global",
    },
    config = function(_, opts)
      require("project_nvim").setup(opts)
      LazyVim.on_load("telescope.nvim", function()
        require("telescope").load_extension("projects")
      end)
    end,
  },
}
