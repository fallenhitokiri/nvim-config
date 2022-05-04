local _M = {}

_M.powerline = {
    circle = {
        left = "",
        right = "",
    },
    arrow = {
        left = "",
        right = "",
    },
    triangle = {
        left = "",
        right = "",
    },
    none = {
        left = "",
        right = "",
    },
}

_M.signs = { Error = "", Warn = "", Hint = "", Info = "" }

_M.setSpacesSize = function(filetypes)
    for filetype, size in pairs(filetypes) do
        vim.cmd(string.format("autocmd FileType %s set sw=%s", filetype, size))
        vim.cmd(string.format("autocmd FileType %s set ts=%s", filetype, size))
        vim.cmd(string.format("autocmd FileType %s set sts=%s", filetype, size))
    end
end

_M.buf_command = function(bufnr, name, fn, opts)
    vim.api.nvim_buf_create_user_command(bufnr, name, fn, opts or {})
end

_M.table = {
    some = function(tbl, cb)
        for k, v in pairs(tbl) do
            if cb(k, v) then
                return true
            end
        end
        return false
    end,
}

return _M

