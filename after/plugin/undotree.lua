vim.keymap.set("n", "<leader>u", function()
    vim.cmd("UndotreeToggle")
    vim.cmd("wincmd p")
end, { noremap = true, silent = true })