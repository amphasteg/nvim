return {
	"mfussenegger/nvim-dap",
	lazy = false,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		require("nvim-dap-virtual-text").setup()

		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
		}

		dap.adapters.lldb = {
			type = "executable",
			command = "lldb-dap",
			name = "lldb",
		}

		dap.configurations.c = {
			{
				name = "Launch file",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
        args = {},
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
