return {
    {
        "rcarriga/nvim-dap-ui",   -- Optional UI for DAP
        config = function()
            require('dapui').setup()
        end
    },
    {
        "mfussenegger/nvim-dap-python",  -- Python-specific DAP adapter
        config = function()
            require('dap-python').setup('python')  -- Path to Python with `debugpy`
        end
    },
    {
        'nvim-neotest/nvim-nio'
    },
    {
        "theHamsta/nvim-dap-virtual-text"
    },
    {
        "mfussenegger/nvim-dap",  -- DAP base plugin
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text"
        },
        config = function()
            require('dap').listeners.after.event_initialized["dapui_config"] = function()
                require('dapui').open()
            end
            require('dap').listeners.before.event_terminated["dapui_config"] = function()
                require('dapui').close()
            end
            require('dap').listeners.before.event_exited["dapui_config"] = function()
                require('dapui').close()
            end
        end
    },
}