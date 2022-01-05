-- Require Configuration
require('dap-python').setup('/usr/bin/python3')
require("dapui").setup()
require('telescope').load_extension('dap')

-- override sign definition for fancy breakpoints
vim.fn.sign_define('DapBreakpoint', {text='ﴫ', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
