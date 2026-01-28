return {
  "Vinni-Cedraz/groq-chat.nvim",
  config = function()
    require("groq-chat").setup({
      api_key = os.getenv("GROQ_API_KEY"),
    })
  end,
}
