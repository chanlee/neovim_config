return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",   -- Copilot.lua 의존성
    "nvim-lua/plenary.nvim",    -- 일반적인 lua 함수 의존성
  },
  opts = {
    -- 기본 설정
  },
  cmd = {
    "CopilotChat",
    "CopilotChatToggle",
    -- 기타 명령어...
  },
  keys = {
    -- 단축키 설정 (선택사항)
    { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "CopilotChat - 열기" },
    -- 기타 단축키...
  },
}
