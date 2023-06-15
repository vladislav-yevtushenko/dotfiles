local notify = require("notify")
notify.setup({
	timeout = 2000,
	stages = 'fade'
})
vim.notify = notify
