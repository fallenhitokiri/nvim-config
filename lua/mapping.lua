function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map("n", "<leader>bn", "<cmd>bn<cr>", { silent = true })
map("n", "<leader>bp", "<cmd>bp<cr>", { silent = true })

map("n", "<leader>n", "<cmd>NvimTreeToggle<cr> <cmd>NvimTreeRefresh<cr>", { silent = true })

map("n", "<leader>ff", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", { silent = true })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
map("n", "<leader>ft", "<cmd>Telescope tags<cr>", { silent = true })

map("n", "<leader>tt", "<cmd>Trouble<cr>", { silent = true })
map("n", "<leader>tq", "<cmd>Trouble quickfix<cr>", { silent = true })
map("n", "<leader>tl", "<cmd>Trouble loclist<cr>", { silent = true })

map("n", "<leader>gt", "<cmd>Gitsigns toggle_signs<cr>", { silent = true })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { silent = true })

map("n", "<leader>sr", "<cmd>Lspsaga rename<cr>", { silent = true })
map("n", "<leader>sa", "<cmd>Lspsaga code_action<cr>", { silent = true })
map("n", "<leader>sd", "<cmd>Lspsaga hover_doc<cr>", { silent = true })
map("n", "<leader>sn", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true })
map("n", "<leader>sp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true })

