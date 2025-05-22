-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Update config keymaps
vim.keymap.set('n', '<leader>X', '<CMD>source %<CR>')
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

--  Remap escape
vim.keymap.set('i', 'jj', '<ESC>')
vim.keymap.set('t', '<c-j><c-j>', [[<C-\><C-n>]])

-- Set root to parent of current file
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>', { silent = true })

-- Pasting and yanking
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set('n', '<c-u>', '<c-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

local term_bufid, term_winid
vim.keymap.set('n', '<leader>tt', function()
  if term_winid and vim.api.nvim_win_is_valid(term_winid) then
    vim.api.nvim_win_close(term_winid, true)
    return
  end

  vim.cmd 'split'
  term_winid = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_height(term_winid, 15)

  if term_bufid and vim.api.nvim_buf_is_valid(term_bufid) then
    vim.api.nvim_win_set_buf(term_winid, term_bufid)
  else
    vim.cmd.term()
    term_bufid = vim.api.nvim_get_current_buf()
  end
end, { desc = '[T]oggle [T]erminal' })

-- Fuzzy search
local builtin = require 'telescope.builtin'
local themed_picker = function(picker, opts)
  return function()
    picker(require('telescope.themes').get_dropdown(vim.tbl_deep_extend('force', {
      previewer = false,
    }, opts or {})))
  end
end

local is_inside_work_tree = {}
local function project_files()
  local cwd = vim.fn.getcwd()
  if is_inside_work_tree[cwd] == nil then
    vim.fn.system 'git rev-parse --is-inside-work-tree'
    is_inside_work_tree[cwd] = vim.v.shell_error == 0
  end

  if is_inside_work_tree[cwd] then
    themed_picker(builtin.git_files)()
  else
    themed_picker(builtin.find_files)()
  end
end

vim.keymap.set('n', '<leader>sh', themed_picker(builtin.help_tags), { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sf', project_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sr', themed_picker(builtin.resume), { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', themed_picker(builtin.oldfiles), { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>sn', themed_picker(builtin.find_files, { cwd = vim.fn.stdpath 'config' }), { desc = '[S]earch [N]eovim files' })
vim.keymap.set('n', '<leader>sb', themed_picker(builtin.buffers), { desc = '[ ] Find existing buffers' })

vim.keymap.del('n', '<leader><leader>')

-- Harpoon
local harpoon = require 'harpoon'

vim.keymap.set('n', '<leader>ma', function()
  local filepath = vim.fn.expand '%'
  harpoon:list():add()
  vim.notify('Added ' .. filepath .. ' to Harpoon', vim.log.levels.INFO)
end, { desc = '[M]ark [A]dd' })
vim.keymap.set('n', '<leader>md', function()
  local filepath = vim.fn.expand '%'
  harpoon:list():remove()
  vim.notify('Deleted ' .. filepath .. ' from Harpoon', vim.log.levels.INFO)
end, { desc = '[M]ark [D]elete' })

vim.keymap.set('n', '<leader>mD', function()
  harpoon:list():clear()
end, { desc = '[M]ark [D]elete all' })

vim.keymap.set('n', '<leader>sm', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = '[S]earch [M]arked files' })
vim.keymap.set('n', '[h', function()

  harpoon:list():prev { ui_nav_wrap = true }
end, { desc = 'goto previous item in the harpoon list' })
vim.keymap.set('n', ']h', function()
  harpoon:list():next { ui_nav_wrap = true }
end, { desc = 'goto next item in the harpoon list' })

vim.keymap.set('n', '<leader>m1', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>m2', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>m3', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>m4', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<leader>m5', function()
  harpoon:list():select(5)
end)
-- vim: ts=2 sts=2 sw=2 et
