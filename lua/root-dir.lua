local args = vim.v.argv
local root_dir

if #args > 2 then
    local arg_path = vim.fn.fnamemodify(args[3], ":p")

    -- Check if the argument is a directory
    local is_directory = vim.fn.isdirectory(arg_path) == 1

    -- Determine root_dir based on whether the argument is a directory or not
    if is_directory then
        root_dir = arg_path
    else
        root_dir = vim.fn.fnamemodify(arg_path, ":p:h")
    end

    vim.cmd("cd " .. root_dir)
end
