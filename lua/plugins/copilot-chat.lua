return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			system_prompt = "You are a helpful AI assistant. Answer concisely and in Korean.",
			-- See Configuration section for options
			prompts = {
				Rename = {
					prompt = "Please rename the variable correctly in given selection based on context",
					selection = function(source)
						local select = require("CopilotChat.select")
						return select.visual(source)
					end,
				},
			},
		},
		-- See Commands section for default commands if you want to lazy load on them
		keys = {
			{ "<Leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
			{ "<Leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
			{ "<Leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review Code" },
			{ "<Leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix Code Issues" },
			{ "<Leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize Code" },
			{ "<Leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate Docs" },
			{ "<Leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate Tests" },
			{ "<Leader>zm", ":CopilotChatCommit<CR>", mode = "n", desc = "Generate Commit Message" },
			{ "<Leader>zs", ":CopilotChatCommit<CR>", mode = "v", desc = "Generate Commit for Selection" },
		},
	},
}
