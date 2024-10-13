-- Require dap and dap-python
local dap = require('dap')
local dapui = require('dapui')
local dap_python = require('dap-python')

-- Set up the debugger for Python (adjust the Python path to your environment)
dap_python.setup('python')  -- Path to Python with `debugpy`

-- Optional: Add some virtual text support (to show values)
require('nvim-dap-virtual-text').setup()

-- Optional: Set up dap-ui for debugging UI (layout, etc.)
dapui.setup()

-- Automatically open and close the dap-ui when starting/stopping debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
