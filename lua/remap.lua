--- oni
-- local function kmap(m, x, y, desc)
--   local opts = { noremap = true, silent = true, desc = desc }
--   vim.keymap.set(m, x, y, opts)
-- end
local kmap = vim.keymap.set

local opts = { noremap = true, silent = true }
-- cursor {{{1
-- Find and center
kmap('n', 'n', 'nzzzv')
kmap('n', 'N', 'Nzzzv')

-- Keep the cursor in place while joining lines.
kmap('n', 'J', 'mzJ`z')

-- Vertical scroll and center
kmap('n', '<C-d>', '<C-d>zz')
kmap('n', '<C-u>', '<C-u>zz')
-- }}}1
-- files {{{1
-- save file
kmap({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
-- }}}1
-- folding {{{1
kmap('n', '<tab>', 'za', { desc = 'toggle folding' })

-- Author: Karl Yngve Lervåg
--    See: https://github.com/lervag/dotnvim

-- Close all fold except the current one.
kmap('n', 'zv', 'zMzvzz', { desc = 'close-all-but-current-fold' })

-- Close current fold when open. Always open next fold.
kmap('n', 'zj', 'zcjzOzz', { desc = 'close-current-open-next-fold' })

-- Close current fold when open. Always open previous fold.
kmap('n', 'zk', 'zckzOzz', { desc = 'close-current-open-prev-fold' })
-- }}}1
-- location and quickfix lists {{{1
-- quickfix navigation
kmap('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })
kmap('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
kmap('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })
-- kmap('n', '<C-k>', '<cmd>cnext<CR>zz')
-- kmap('n', '<C-j>', '<cmd>cprev<CR>zz')

-- location
kmap('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
kmap('n', '<leader>k', '<cmd>lnext<CR>zz')
kmap('n', '<leader>j', '<cmd>lprev<CR>zz')
-- }}}1
-- register {{{1
-- greatest remap ever
-- Keep last yanked when pasting
kmap('x', '<leader>p', [["_dP]])
kmap({ 'n', 'v' }, '<leader>D', '"_d')

-- next greatest remap ever : asbjornHaland
-- Explicitly yank to system clipboard (highlighted and entire row)
-- kmap({ 'n', 'v' }, '<leader>y', [["+y]])
-- kmap('n', '<leader>Y', [["+Y]])

-- delete single character without copying into register
kmap('n', 'x', '"_x', opts)
-- }}}1
-- search and replace {{{1
kmap('n', 'R', [[:%s//gc<Left><Left><Left>]], { noremap = true, desc = 'replace all occurrences' })
-- kmap('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--
-- }}}1
-- text editing {{{1
-- Increment/decrement numbers
kmap('n', '<leader>+', '<C-a>', opts) -- increment
kmap('n', '<leader>-', '<C-x>', opts) -- decrement

-- Add undo break-points
kmap('i', ',', ',<c-g>u')
kmap('i', '.', '.<c-g>u')
kmap('i', ';', ';<c-g>u')

-- better indenting
kmap('v', '<', '<gv')
kmap('v', '>', '>gv')

-- reordering Lines
kmap('v', 'J', ":m '>+1<CR>gv=gv")
kmap('v', 'K', ":m '<-2<CR>gv=gv")

-- kmap('n', '<C-k>', [[:let save_a=@a<cr><Up>"add"ap<Up>:let @a=save_a<cr>]], { desc = 'move up (line)' })
-- kmap('n', '<C-j>', [[:let save_a=@a<cr>"add"ap:let @a=save_a<cr>]], { desc = 'move down (line)' })
-- kmap('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
-- kmap('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
-- kmap('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
-- kmap('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
-- kmap('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
-- kmap('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })
-- }}}1
-- text navigation {{{1
-- Move normally between wrapped lines
-- better up/down
kmap({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
kmap({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
kmap('n', '0', 'g0', opts)
kmap('n', '$', 'g$', opts)
-- }}}1
-- windows {{{1
-- Resize window using <ctrl> arrow keys
kmap('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
kmap('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
kmap('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
kmap('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })
-- }}}1

-- Save and load session
kmap('n', '<leader>ss', ':mksession! .session.vim<CR>', { noremap = true, silent = false })
kmap('n', '<leader>sl', ':source .session.vim<CR>', { noremap = true, silent = false })

--
--
-- kmap('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })
--
