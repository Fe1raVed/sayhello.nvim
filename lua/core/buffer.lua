local api = vim.api
local buf_number = -1
local buf_name = "result"
local M = {}

M.open_buffer = function()
  if buf_number ~= api.nvim_get_current_buf() then
    vim.cmd("new")
    buf_number = api.nvim_get_current_buf()
    api.nvim_buf_set_name(buf_number, buf_name)
    api.nvim_buf_set_option(buf_number, "buftype", "nofile")
  end
end

---@param bufname string
M.close_buffer = function(bufname)
  if string.find(bufname, vim.fn.bufname("%")) then
    vim.cmd("bwipeout!")
  else
    local bufid = vim.fn.bufnr(bufname)
    if bufid ~= -1 then
      vim.cmd("bwipeout!" .. bufid)
    end
  end
end
return M
