return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html", -- if you don't have treesitter html parser
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- optional
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>lr", "<cmd>Leet run<cr>", desc = "Leet Run" },
    { "<leader>ls", "<cmd>Leet submit<cr>", desc = "Leet Submit" },
    { "<leader>ll", "<cmd>Leet list<cr>", desc = "Leet List" },
    { "<leader>ld", "<cmd>Leet daily<cr>", desc = "Leet Daily" },
    { "<leader>lc", "<cmd>Leet console<cr>", desc = "Leet Console" },
    { "<leader>lR", "<cmd>Leet reset<cr>", desc = "Leet Reset" },
  },
  opts = {
    -- configuration goes here
    lang = "python3", -- change to your preferred language: cpp, java, javascript, typescript, rust, go, etc.

    cn = { -- leetcode.cn (Chinese version)
      enabled = false,
    },

    storage = {
      home = vim.fn.stdpath("data") .. "/leetcode",
      cache = vim.fn.stdpath("cache") .. "/leetcode",
    },

    plugins = {
      non_standalone = true,
    },
    injector = {
      ["python3"] = {
        imports = function()
          return {}
        end,
      },
    },
    image_support = true,
    logo = [[
              _____                   _______                   _____            _____          
         /\    \                 /::\    \                 /\    \          /\    \         
        /::\____\               /::::\    \               /::\____\        /::\    \        
       /:::/    /              /::::::\    \             /:::/    /       /::::\    \       
      /:::/    /              /::::::::\    \           /:::/    /       /::::::\    \      
     /:::/    /              /:::/~~\:::\    \         /:::/    /       /:::/\:::\    \     
    /:::/____/              /:::/    \:::\    \       /:::/    /       /:::/__\:::\    \    
   /::::\    \             /:::/    / \:::\    \     /:::/    /       /::::\   \:::\    \   
  /::::::\    \   _____   /:::/____/   \:::\____\   /:::/    /       /::::::\   \:::\    \  
 /:::/\:::\    \ /\    \ |:::|    |     |:::|    | /:::/    /       /:::/\:::\   \:::\    \ 
/:::/  \:::\    /::\____\|:::|____|     |:::|    |/:::/____/       /:::/  \:::\   \:::\____\
\::/    \:::\  /:::/    / \:::\    \   /:::/    / \:::\    \       \::/    \:::\  /:::/    /
 \/____/ \:::\/:::/    /   \:::\    \ /:::/    /   \:::\    \       \/____/ \:::\/:::/    / 
          \::::::/    /     \:::\    /:::/    /     \:::\    \               \::::::/    /  
           \::::/    /       \:::\__/:::/    /       \:::\    \               \::::/    /   
           /:::/    /         \::::::::/    /         \:::\    \              /:::/    /    
          /:::/    /           \::::::/    /           \:::\    \            /:::/    /     
         /:::/    /             \::::/    /             \:::\    \          /:::/    /      
        /:::/    /               \::/____/               \:::\____\        /:::/    /       
        \::/    /                 ~~                      \::/    /        \::/    /        
         \/____/                                           \/____/          \/____/         

    ]],

    -- other options: picker, console, description, hooks, keys, etc.
  },
  -- lazy-load only when you run :Leet
  cmd = "Leet",
}
