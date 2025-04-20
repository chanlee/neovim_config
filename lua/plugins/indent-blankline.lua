return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",        -- v3부터는 main을 ibl로 지정해야 함
    opts = {
      -- 필요한 옵션을 여기에 추가
      indent = { char = "│" },     -- 인덴트 문자 설정
      scope = { enabled = true },  -- 현재 범위 하이라이트
      whitespace = { remove_blankline_trail = true },
    },
    event = "BufReadPre", -- 원하는 로딩 시점 지정(옵션)
    config = function(_, opts)
      vim.cmd([[highlight IndentBlanklineIndent1 guifg=#FDC9C9 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guifg=#FFE7C9 gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent3 guifg=#FFFAC9 gui=nocombine]])
      require("ibl").setup(opts)
    end,

  },
}

