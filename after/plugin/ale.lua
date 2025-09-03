-- Setup Linter
-- Prettier for formatting
-- JS/TS Linter
-- vim.b.ale_fixers = {
--     'prettier',
--     'eslint',
-- }

-- vim.b.ale_fixers = {
--     'javascript': ['prettier', 'eslint'],
--     'go': ['gofmt', 'golint'],
    

vim.b.ale_fixers = {
    javascript = {'prettier', 'eslint'},
    go = {'gofmt', 'golint'},
    typescript = {'prettier', 'eslint'},
    css = {'prettier'},
    html = {'prettier'},
    json = {'prettier'},
    lua = {'luafmt'},
    python = {'black'},
    rust = {'rustfmt'},
    yaml = {'prettier'},
    vim = {'vint'},
    cmake = {'cmake-format'},
    svelte = {'prettier'},
    tsx = {'prettier', 'eslint'},
    vue = {'prettier', 'eslint'},
    tailwind = {'prettier', 'eslint'},
}

vim.b.ale_linters_explicit = 1
vim.b.ale_fix_on_save = 1

vim.b.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    go = {'golangci-lint'},
    css = {'stylelint'},
    html = {'htmlhint'},
    json = {'jsonlint'},
    lua = {'luacheck'},
    python = {'flake8'},
    rust = {'cargo'},
    yaml = {'yamllint'},
    vim = {'vint'},
    cmake = {'cmake'},
    svelte = {'svelte'},
    tsx = {'eslint'},
    vue = {'eslint'},
    tailwind = {'eslint'},
}

-- vim.b.ale_css

-- Neoformat Update Config
-- require("neo
-- let g:neoformat_run_all_formatters = 1
vim.g.neoformat_run_all_formatters = 1
-- let g:neoformat_enabled_javascript = ['prettier', 'eslint']

