require("bruce")
require("bruce.lazy")

vim.g.clipboard = {
	name = "win32yank-wsl",
	copy = {
		["+"] = "/home/bruce/win32yank.exe -i --crlf", 
		["*"] = "/home/bruce/win32yank.exe -i --crlf" 
	},
	paste = {
		["+"] = "/home/bruce/win32yank.exe -o --lf", 
		["*"] = "/home/bruce/win32yank.exe -o --lf" 
	},
	cache_enable = 0,
}
