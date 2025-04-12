local function cht_sh_query(args)
  local buf_name = 'cheat.sh'
  local buf = nil

  -- Clear 'cheat.sh' buffer if it already exists
  for _, b in ipairs(vim.api.nvim_list_bufs()) do
    local buf_path = vim.api.nvim_buf_get_name(b)
    if vim.fn.fnamemodify(buf_path, ':t') == buf_name then
      buf = b
      vim.cmd('buffer ' .. buf)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
      break
    end
  end

  -- Create a 'cheat.sh' buffer in a vertical split
  if buf == nil then
    vim.cmd 'vsplit | enew'
    buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    vim.api.nvim_buf_set_option(buf, 'swapfile', false)
    vim.api.nvim_buf_set_name(buf, buf_name)
  end

  -- Parse arguments
  local splited_args = vim.split(args.args, ' ', { trimempty = true })
  local language = splited_args[1]
  local url = 'https://cht.sh/' .. language

  if splited_args[2] ~= nil then
    local query = table.concat(splited_args, '+', 2)
    url = url .. '/' .. query
  else
    language = 'bash'
  end

  -- Fetch content
  local content = vim.fn.systemlist('curl -s ' .. url .. '?T')
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln 'Error fetching cheat sheet'
    return
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, content)
  vim.cmd('setlocal filetype=' .. language)
end

vim.api.nvim_create_user_command('Cheat', cht_sh_query, { nargs = '+' })

vim.api.nvim_create_user_command('Grep', function(opts)
  local args = table.concat(opts.fargs, ' ')
  local cmd = vim.opt.grepprg['_value'] .. ' ' .. vim.fn.expandcmd(args)
  vim.cmd('cgetexpr system("' .. cmd .. '")')
  vim.cmd 'cwindow'
end, { nargs = '+' })

vim.api.nvim_create_user_command('LGrep', function(opts)
  local args = table.concat(opts.fargs, ' ')
  local cmd = vim.opt.grepprg['_value'] .. ' ' .. vim.fn.expandcmd(args)
  vim.cmd('lgetexpr system("' .. cmd .. '")')
  vim.cmd 'lwindow'
end, { nargs = '+' })

vim.api.nvim_create_autocmd('CmdlineEnter', {
  pattern = { ':' },
  callback = function()
    vim.cmd [[
            cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
            cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'
        ]]
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('term-config', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "NeogitStatus",
  callback = function()
    vim.cmd("checktime")
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {command = 'startinsert'})
