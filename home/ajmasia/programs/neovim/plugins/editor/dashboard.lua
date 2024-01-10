local logo = "01101110 01100101 01101111 01110110 01101001 01101101"
logo = string.rep("\n", 8) .. logo .. "\n\n"

require("dashboard").setup({
	theme = "hyper",
	config = {
		header = vim.split(logo, "\n"),
		packages = { enable = false },
		shortcut = {
			{
				desc = "󱊓 Project",
				group = "DashboardProjectTitle",
				action = "Telescope projects",
				key = "p",
			},
			{
				desc = "󰥨 File",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = "󰥨 Recent",
				group = "Label",
				action = "Telescope oldfiles",
				key = "r",
			},
			{
				desc = " Restore",
				group = "Number",
				action = "lua require('persistence').load()",
				key = "s",
			},
			{
				desc = "󰋠 Health",
				group = "DiagnosticHint",
				action = "checkhealth",
				key = "h",
			},
			{
				desc = " Config",
				group = "@property",
				action = "e ~/.dotfiles/home/ajmasia/programs/neovim/default.nix",
				key = "c",
			},
		},
		footer = function()
			-- local currentConfig = "" .. os.getenv("MYVIMRC")
			local currentConfig = "Using Nixvim"
			local nvimVersion =
				string.format("Using Neovim v%d.%d.%d", vim.version().major, vim.version().minor, vim.version().patch)

			return { "", nvimVersion, currentConfig, "", "🚀 Sharp tools make good work" }
		end,
	},
})
