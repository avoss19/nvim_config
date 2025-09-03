local dap = require("dap")
local dapui  = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

require('dap-go').setup {
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- the path to the executable dlv which will be used for debugging.
    -- by default, this is the "dlv" executable on your PATH.
    path = "dlv",
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}",
    -- additional args to pass to dlv
    args = {},
    -- the build flags that are passed to delve.
    -- defaults to empty string, but can be used to provide flags
    -- such as "-tags=unit" to make sure the test suite is
    -- compiled during debugging, for example.
    -- passing build flags using args is ineffective, as those are
    -- ignored by delve in dap mode.
    build_flags = "",
  },
}

-- require('dap-go').setup {
--   dap_configurations = {
--     {
--       type = "go",
--       name = "Attach remote",
--       mode = "remote",
--       request = "attach",
--     },
--   },
-- }

--
-- Mappings
--
-- vim.keymap.set({
--     { 'n', '<leader>td', [[<cmd> lua require('dap-go').continue()<CR>]] },
--     -- { 'n', '<leader>ts', [[<cmd> lua require('dap-go').stop()<CR>]] },
--     { 'n', '<leader>tr', [[<cmd> lua require('dap-go').restart()<CR>]] },
--     { 'n', '<leader>tl', [[<cmd> lua require('dap-go').logpoints()<CR>]] },
--     { 'n', '<leader>to', [[<cmd> lua require('dap-go').step_over()<CR>]] },
--     { 'n', '<leader>tp', [[<cmd> lua require('dap-go').step_out()<CR>]] },
--     { 'n', '<leader>tt', [[<cmd> lua require('dap-go').toggle_breakpoint()<CR>]] },
--     { 'n', '<leader>tc', [[<cmd> lua require('dap-go').debug_continue()<CR>]] },
--     { 'n', '<leader>ts', [[<cmd> lua require('dap-go').debug_stop()<CR>]] },
--     { 'n', '<leader>tr', [[<cmd> lua require('dap-go').debug_restart()<CR>]] },
-- }, 'dap-go')

-- Icons for debug
-- vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
-- vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- DAP UI
dap.adapters.go = function(callback, config)
  -- Wait for delve to start
    vim.defer_fn(function()
        callback({type = "server", host = "127.0.0.1", port = "port"})
      end,
    100)
end

local dapgo = require('dap-go')

-- Mappings
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
vim.keymap.set('n', '<leader>ds', function() dapui.open() end)
vim.keymap.set('n', '<leader>dt', function() dapgo.debug_test() end)




-- Dap.configurations.go = {
--     {
--       type = "go",
--       name = "Debug",
--       request = "launch",
--       program = "${file}",
--     },
-- }

-- Microcock VSCode
-- require('dap.ext.vscode').load_launchjs(nil, {})



