---@diagnostic disable, undefined-global: 113
vim.diagnostic.config({
	virtual_text = false,
	sings = true,
	update_in_insert = true,
	float = {
		-- spacing = 2,
		source = "if_many",
		-- prefix = "●",
	},
})

--Signcolumn symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type

	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Show diagnostics on hover
vim.o.updatetime = 150
-- vim.cmd([[autocmd CursorHold * lua ShowDiagnostics()]])

function ShowDiagnostics()
	local opts = {
		focusable = false,
		border = "rounded",
		-- width = 80,
		-- height = 30,
		padding = { 1, 1, 1, 1 },
	}

	vim.diagnostic.open_float(nil, opts)
end

-- TODO: move this keymap to a better place
vim.api.nvim_set_keymap(
	"n",
	"<Leader>cd",
	"<cmd>lua ShowDiagnostics()<cr>",
	{ noremap = true, silent = true, desc = "Show Line diagnostic" }
)
