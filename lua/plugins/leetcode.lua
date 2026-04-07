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

    injector = { -- auto-inject code before/after (like snippets)
      ["python3"] = {
        before = true, -- use default
      },
      ["cpp"] = {
        before = { "#include <bits/stdc++.h>", "using namespace std;" },
        after = "int main() {}",
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
