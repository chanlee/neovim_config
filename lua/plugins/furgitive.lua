return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "Gstatus",
    "Gblame",
    "Gpush",
    "Gpull",
    "Gdiff",
    "Gcommit",
    "Gwrite",
    "Gread",
  },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>",        desc = "Git status" },
    { "<leader>gb", "<cmd>Git blame<cr>",  desc = "Git blame" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gd", "<cmd>Gdiff<cr>",      desc = "Git diff" },
    { "<leader>gp", "<cmd>Git push<cr>",   desc = "Git push" },
    { "<leader>gl", "<cmd>Git pull<cr>",   desc = "Git pull" },
    -- 현재 파일을 git add 하는 키맵 추가
    { "<leader>ga", "<cmd>Gwrite<cr>",     desc = "Git add current file" },
    -- Git status 화면에서 커서 아래 파일을 스테이징/언스테이징 토글
    { "<leader>gt", "<cmd>Git add %<cr>",  desc = "Git add current file (alternative)" },
    -- 모든 변경된 파일을 git add 하는 키맵 추가
    { "<leader>gA", "<cmd>Git add .<cr>",  desc = "Git add all files" },
  },
  config = function()
    -- 여기에 추가 설정을 넣을 수 있습니다
    vim.cmd([[
      set diffopt+=vertical
      " Git status 창에서 파일을 스테이징/언스테이징하는 매핑 추가
      autocmd FileType fugitive nmap <buffer> s :Git add %:p<CR>
      autocmd FileType fugitive nmap <buffer> u :Git reset HEAD %:p<CR>
    ]])

    -- 커스텀 명령어 정의 (선택적)
    vim.api.nvim_create_user_command("Gadd", function(opts)
      if opts.args and opts.args ~= "" then
        vim.cmd("Git add " .. opts.args)
      else
        vim.cmd("Gwrite")
      end
    end, { nargs = "?", desc = "Git add with optional path" })
  end,
}
