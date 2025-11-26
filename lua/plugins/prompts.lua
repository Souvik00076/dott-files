return {
  {
    "David-Kunz/gen.nvim",
    config = function()
      require("gen").prompts["NewCode"] = {
        prompt = "Follow the prompt:\n$text",
        replace = false,
      }
    end,
  },
}
