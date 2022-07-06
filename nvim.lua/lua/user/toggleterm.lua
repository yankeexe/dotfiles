require("toggleterm").setup {
  open_mapping = [[<c-j>]],
  direction = "float"
}


local Terminal = require("toggleterm.terminal").Terminal
local python = Terminal:new({ cmd = "bpython", hidden = true })

function _PYTHON_TOGGLE()
 python:toggle()
end
