local easypick = require("easypick")
easypick.setup({
	pickers = {
		{ -- this is a dummy example, change with something useful later
			name = "ls",
			command = "ls",
			previewer = easypick.previewers.default(),
		},
	},
})
