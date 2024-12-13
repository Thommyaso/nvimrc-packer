
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({
        cwd = vim.fn.getcwd(),
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('n', '<CR>', function(prmopt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd('tabedit ' .. entry.path)
            end)
            return true
        end,
    })
end, {noremap = true, silent = true})

vim.keymap.set('n', '<C-p>', function()
    builtin.git_files({
        cwd = vim.fn.getcwd(),
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('n', '<CR>', function(prmopt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd('tabedit ' .. entry.path)
            end)
            return true
        end,
    })
end, {noremap = true, silent = true})

vim.keymap.set('v', '<leader>ps', function()
    vim.cmd('noau normal! "vy')
    local selected_text = vim.fn.getreg('v')
    local command = string.format("Grep > %s", selected_text)
    builtin.grep_string({
        search = vim.fn.input(command),
        wd = vim.fn.getcwd(),
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('n', '<CR>', function(prmopt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd('tabedit ' .. entry.path)
            end)
            return true
        end,
    })
end, {noremap = true, silent = true})

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({
        search = vim.fn.input("Grep > "),
        cwd = vim.fn.getcwd(),
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('n', '<CR>', function(prmopt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd('tabedit ' .. entry.path)
            end)
            return true
        end,
    })
end, {noremap = true, silent = true})

-- Finding all directiories inside pwd:
-- install: <sudo apt install fd-find> for this to work
vim.keymap.set('n', '<leader>pd', function()
    builtin.find_files({
        find_command = { 'fdfind', '--type', 'd' },
        cwd = vim.fn.getcwd(),
        attach_mappings = function(_, map)
            local actions = require('telescope.actions')
            local action_state = require('telescope.actions.state')
            map('n', '<CR>', function(prmopt_bufnr)
                local entry = action_state.get_selected_entry()
                vim.cmd('tabedit ' .. entry.path)
            end)
            return true
        end,
    })
end, {noremap = true, silent = true})
