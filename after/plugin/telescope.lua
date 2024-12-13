local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('v', '<leader>ps', function()
    vim.cmd('noau normal! "vy')
    local selected_text = vim.fn.getreg('v')
    builtin.grep_string({ search = selected_text });
end)
