-- browser
vim.g.mkdp_browser = 'brave-browser'
-- vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_auto_start = 1

-- Set to 1, nvim will open the preview window after entering the Markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 0

-- Set to 1, the nvim will auto close current preview window when changing
-- from Markdown buffer to another buffer
-- default: 1
vim.g.mkdp_auto_close = 1

-- Set to 1, Vim will refresh Markdown when saving the buffer or
-- when leaving insert mode. Default 0 is auto-refresh Markdown as you edit or
-- move the cursor
-- default: 0
vim.g.mkdp_refresh_slow = 0

-- Set to 1, the MarkdownPreview command can be used for all files,
-- by default it can be use in Markdown files only
-- default: 0
vim.g.mkdp_command_for_global = 0

-- Set to 1, the preview server is available to others in your network.
-- By default, the server listens on localhost (127.0.0.1)
-- default: 0
vim.g.mkdp_open_to_the_world = 0

-- Use custom IP to open preview page.
-- Useful when you work in remote Vim and preview on local browser.
-- default empty
vim.g.mkdp_open_ip = ''

-- Specify browser to open preview page
-- default: ''
vim.g.mkdp_browser = ''

-- Set to 1, echo preview page URL in command line when opening preview page
-- default is 0
vim.g.mkdp_echo_preview_url = 0

-- A custom Vim function name to open preview page
-- this function will receive URL as param
-- default is empty
vim.g.mkdp_browserfunc = ''

-- Options for Markdown rendering
vim.api.nvim_set_var('mkdp_preview_options', {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
})

-- Use a custom Markdown style. Must be an absolute path
vim.g.mkdp_markdown_css = ''

-- Use a custom highlight style. Must be an absolute path
vim.g.mkdp_highlight_css = ''

-- Use a custom port to start server or empty for random
vim.g.mkdp_port = ''

-- Preview page title
vim.g.mkdp_page_title = '「${name}」'

-- Use a custom location for images
vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- Recognized filetypes
vim.g.mkdp_filetypes = {'markdown'}

-- Set default theme (dark or light)
vim.g.mkdp_theme = 'dark'

-- Combine preview window
vim.g.mkdp_combine_preview = 0

-- Auto refetch combine preview contents when change markdown buffer
vim.g.mkdp_combine_preview_auto_refresh = 1

