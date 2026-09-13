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

		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = "scopes",
							size = 0.35,
						},
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.25,
						},
						{
							id = "watches",
							size = 0.15,
						},
					},
					position = "left",
					size = 40,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "console",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 10,
				},
			},
			mappings = {
				edit = "e",
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				repl = "r",
				toggle = "t",
			},
		})

		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
			detached = false,
      options = {
        initialize_timeout_sec = 60
      }
		}

		dap.configurations.c = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.listeners.before["initialize"]["c-debug"] = function(body)
			if body.filetype == "c" then
				local program = vim.fn.input("Path to executable: ", vim.fs.joinpath(vim.fn.getcwd(), "/"), "file")
				local args = vim.fn.input("Additional args: ")

				local argsTable = {}
				for k, v in string.gmatch(args, "([^ ]+)") do
					argsTable[#argsTable + 1] = k
				end

        body.config.program = program
        body.config.args = argsTable
			end
		end

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			vim.schedule(function()
				dapui.close()
			end)
		end
		dap.listeners.before.event_exited.dapui_config = function()
			vim.schedule(function()
				dapui.close()
			end)
		end
	end,
}
