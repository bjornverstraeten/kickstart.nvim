local Terminal = require('toggleterm.terminal').Terminal
local ipython = Terminal:new {
  cmd = 'ipython --no-autoindent',
  direction = 'vertical',
  hidden = true,
}
ipython:spawn()
ipython:resize(vim.o.columns * 0.4)

local trim_spaces = false

vim.keymap.set('n', '<leader>r', function()
  require('toggleterm').send_lines_to_terminal('single_line', trim_spaces, { args = ipython.id })
end, { desc = '[R]un lines' })

vim.keymap.set('v', '<leader>r', function()
  -- visual markers only update after leaving visual mode
  local esc = vim.api.nvim_replace_termcodes('<esc>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'x', false)

  -- get selected text
  local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(0, '<'))
  local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(0, '>'))
  local lines = vim.fn.getline(start_line, end_line)

  -- send selection with trimmed indent
  local cmd = ''
  local indent = nil
  for _, line in ipairs(lines) do
    if indent == nil and line:find '[^%s]' ~= nil then
      indent = line:find '[^%s]'
    end
    -- (i)python interpreter evaluates sent code on empty lines -> remove
    if not line:match '^%s*$' then
      cmd = cmd .. line:sub(indent or 1) .. string.char(13) -- trim indent
    end
  end
  require('toggleterm').exec(cmd, 1)
end, { desc = '[R]un lines' })

function _ipython_toggle()
  ipython:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>ti', '<cmd>lua _ipython_toggle()<CR>', { noremap = true, silent = true, desc = '[T]oggle [I]python' })
