local buffer = require("core.buffer")
return {
  execute = function()
    vim.ui.input({
      prompt = "Name :"
    }, function(name)
      buffer.close_buffer("result")
      buffer.open_buffer()
      current_buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_lines(current_buf, 0, -1, true, { "Hello " .. name })
    end)
  end
}
